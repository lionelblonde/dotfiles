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

-- Instant window resizing, none of this animation shit
window.animationDuration = 0

-- Toggle an application between being the frontmost app, and being hidden
local function toggle_application(_app)
   local app = appfinder.appFromName(_app)
   local mainwin = app:mainWindow()
   if mainwin then
      if mainwin == window.focusedWindow() then
         mainwin:application():hide()
      else
         mainwin:application():activate(true)
         mainwin:application():unhide()
         mainwin:focus()
      end
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
hyperapps["i"] = "Ghostty"
hyperapps["k"] = "Bike"
-- hyperapps["p"] = ""
hyperapps["h"] = "Mail"
hyperapps["j"] = "Safari"
hyperapps["m"] = "IINA"
-- hyperapps[";"] = ""
-- hyperapps["'"] = ""
-- hyperapps["o"] = ""
hyperapps["n"] = "Reminders"
hyperapps["l"] = "sioyek"
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
