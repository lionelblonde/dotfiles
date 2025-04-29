local grid = require "hs.grid"
local window = require "hs.window"
local tabs = require "hs.tabs"
local alert = require "hs.alert"
local timer = require "hs.timer"
local application = require "hs.application"
local appfinder = require "hs.appfinder"
local hotkey = require "hs.hotkey"
local layout = require "hs.layout"
local caffeinate = require "hs.caffeinate"
local notify = require "hs.notify"


-- Speaker
speaker = hs.speech.new()

-- Set up the grid
grid.setMargins("1, 1")
grid.setGrid("2x1", "Color LCD")
grid.setGrid("1x4", "1080x1920")
grid.setGrid("1x4", "1050x1680")
grid.setGrid("1x4", "1200x1920")
grid.setGrid("3x1", "3440x1440")

-- Aliases
local hyper = {"control", "shift"}

-- Instant window resizing, none of this animation stuff
window.animationDuration = 0

-- Toggle an application between being the frontmost app, or cycling through the windows
local function toggle_application(_app)

    local app = hs.application.get(_app)

    -- Uncomment this block to also allow for app launches
    -- if not app then
    --     hs.application.launchOrFocus(_app)
    --     return
    -- end

    -- Get all visible, standard windows
    local windows = hs.fnutils.filter(app:visibleWindows(), function(w)
        return w:isStandard()
    end)

    -- No visible standard windows? Just activate
    if #windows == 0 then
        app:activate()
        return
    end

    local focused = hs.window.focusedWindow()

    if focused and focused:application():name() == _app then
        -- App is already focused: cycle through windows
        -- First, sort windows by window ID to ensure stable ordering
        table.sort(windows, function(a, b) return a:id() < b:id() end)

        -- Find index of currently focused window
        local currentIdx = nil
        for i, win in ipairs(windows) do
            if win:id() == focused:id() then
                currentIdx = i
                break
            end
        end

        local nextWindow
        if currentIdx then
            nextWindow = windows[(currentIdx % #windows) + 1]
        else
            nextWindow = windows[1]
        end
        nextWindow:focus()
    else
        -- App not focused: activate and bring frontmost window
        app:activate()
        windows[1]:focus()
    end
end

local frameCache = {} --reset the cache
-- Toggle a window between its normal size, and being maximized
local function toggle_window_maximized()
   local win = window.focusedWindow()
   if frameCache[win:id()] then
      win:setFrame(frameCache[win:id()])
      frameCache[win:id()] = nil
   else
      frameCache[win:id()] = win:frame()
      win:maximize()
   end
end

-- Press Command-q twice to quit an application
local quit_modal = hotkey.modal.new('cmd','q')
local waiting_time = 1.5

function quit_modal:entered() -- luacheck: ignore
   alert.show("Press Command-Q again to quit", waiting_time)
   timer.doAfter(waiting_time, function() quit_modal:exit() end)
end

local function do_quit()
   application.frontmostApplication():kill()
end

quit_modal:bind('cmd', 'q', do_quit)
quit_modal:bind('', 'escape', function() quit_modal:exit() end)

--[[ And now for hotkeys relating to Hyper.
First, let's capture all of the functions, then we can just quickly iterate and bind them]]
local hyperfns = {}

-- Hotkey to reload config
hyperfns["x"] = function() hs.reload() end  -- luacheck: ignore

-- Hotkey to show grid
hyperfns["g"] = grid.show

-- Hotkeys to resize the windows absolutely
hyperfns["["] = function() window.focusedWindow():moveToUnit(layout.left50) end
hyperfns["]"] = function() window.focusedWindow():moveToUnit(layout.right50) end
hyperfns["="] = toggle_window_maximized

-- Hotkeys to toggle focus on applications
local hyperapps = {}
-- hyperapps["y"] = ""
hyperapps["u"] = "Finder"
hyperapps["i"] = "kitty"
hyperapps["k"] = "Bike"
hyperapps["p"] = "Dash"
hyperapps["h"] = "Mail"
hyperapps["j"] = "Brave Browser"
hyperapps["m"] = "IINA"
hyperapps[";"] = "Messages"
-- hyperapps["'"] = ""
hyperapps["o"] = "SelfControl"
hyperapps["n"] = "Things"
hyperapps["l"] = "Preview"
hyperapps[","] = "Calendar"
hyperapps["."] = "Slack"

for k, v in pairs(hyperapps) do
   hyperfns[k] = function() toggle_application(v) end
end

-- Bind all the hotkeys and functions together
for _hotkey, _fn in pairs(hyperfns) do
   hotkey.bind(hyper, _hotkey, _fn)
end

-- Show launch application's keystroke
local showAppKeystrokeAlertId = ""

local function showAppKeystroke()
   if showAppKeystrokeAlertId == "" then
      -- Show application keystroke if alert id is empty.
      local keystroke = ""
      local keystrokeString = ""
      for key, app in pairs(hyperapps) do
         print(key, app)
         keystrokeString = string.format(" %-10s%s", key, app:gsub(".app", ""))

         if keystroke == "" then
            keystroke = keystrokeString
         else
            keystroke = keystroke .. "\n" .. keystrokeString
         end
      end

      showAppKeystrokeAlertId = hs.alert.show(
         keystroke,
         {textFont = "Pixel Code",
          textSize = 24,
          radius = 0,
          strokeColor = hs.drawing.color.asRGB({hex="#1DB954", alpha=0.75})},
         hs.screen.mainScreen(), 25)
   else
      -- Otherwise hide keystroke alert.
      hs.alert.closeSpecific(showAppKeystrokeAlertId)
      showAppKeystrokeAlertId = ""
   end
end
hotkey.bind(hyper, "space", showAppKeystroke)

-- Start the screensaver
hotkey.bind(hyper, "c", function() hs.caffeinate.startScreensaver() end)

-- Finally, show a notification that we finished loading the config successfully
notify.new({title = 'Hammerspoon', informativeText = 'Config loaded'}):send()
-- speaker:speak("config reloaded successfully")


-- Highlight the window currently in focus with a red line
local highlight = nil

local function highlightFocusedWindow()
   if highlight then
      highlight:delete()
      highlight = nil
   end
   local win = hs.window.focusedWindow()
   if win then
      local frame = win:frame()

      highlight = hs.drawing.rectangle(frame)
      highlight:setStrokeColor({red=1, green=0, blue=0, alpha=0.8}) -- orange-ish
      highlight:setFill(false)
      highlight:setStrokeWidth(6)
      highlight:setRoundedRectRadii(8, 8) -- rounded corners!
      highlight:setLevel(hs.drawing.windowLevels.floating) -- stays above normal windows
      highlight:bringToFront(true)
      highlight:show()

      -- Optional: add a slight shadow for a premium feel
      highlight:setShadow(true)
   end
end

-- Reposition the highlight if window moves or resizes
local function updateHighlight()
   if not highlight then return end
   local win = hs.window.focusedWindow()
   if win then
      highlight:setFrame(win:frame())
   end
end

-- Watch window focus/move/resize
local wf = hs.window.filter.default

wf:subscribe({
   hs.window.filter.windowFocused,
   hs.window.filter.windowMoved,
   hs.window.filter.windowResized
}, function()
   highlightFocusedWindow()
end)

wf:subscribe(hs.window.filter.windowUnfocused, function()
   if highlight then
      highlight:delete()
      highlight = nil
   end
end)

-- Periodic check to fix rare edge cases
hs.timer.doEvery(1, function()
   updateHighlight()
end)

-- Automatically reload your Hammerspoon configuration whenever this file is saved
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()
