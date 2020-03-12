local grid = require "hs.grid"
local window = require "hs.window"
local alert = require "hs.alert"
local timer = require "hs.timer"
local application = require "hs.application"
local appfinder = require "hs.appfinder"
local hotkey = require "hs.hotkey"
local layout = require "hs.layout"
local caffeinate = require "hs.caffeinate"
local notify = require "hs.notify"

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

-- Hotkey to lock the screen
hyperfns["c"] = function() caffeinate.lockScreen() end

-- Hotkey to show grid
hyperfns["g"] = grid.show

-- Hotkeys to move windows accross screens
hyperfns[","] = function() window.focusedWindow():moveOneScreenWest() end
hyperfns["."] = function() window.focusedWindow():moveOneScreenEast() end

-- Hotkeys to resize the windows absolutely
hyperfns["["] = function() window.focusedWindow():moveToUnit(layout.left50) end
hyperfns["]"] = function() window.focusedWindow():moveToUnit(layout.right50) end
hyperfns["="] = toggle_window_maximized

-- Hotkeys to toggle focus on applications
hyperfns["y"] = function() toggle_application("Sketch") end
hyperfns["u"] = function() toggle_application("Finder") end
hyperfns["i"] = function() toggle_application("iTerm2") end
hyperfns["o"] = function() toggle_application("Spotify") end
hyperfns["p"] = function() toggle_application("Dash") end
hyperfns["h"] = function() toggle_application("Mail") end
hyperfns["j"] = function() toggle_application("Safari") end
hyperfns["m"] = function() toggle_application("Sublime Text")end
hyperfns[";"] = function() toggle_application("Sublime Merge") end
hyperfns["'"] = function() toggle_application("Telegram") end
hyperfns["\\"] = function() toggle_application("Slack") end  -- backslash needs to be escaped
hyperfns["k"] = function() toggle_application("Notes") end
hyperfns["n"] = function() toggle_application("Google Chrome") end
hyperfns["l"] = function() toggle_application("Skim") end

-- Bind all the hotkeys and functions together
for _hotkey, _fn in pairs(hyperfns) do
  hotkey.bind(hyper, _hotkey, _fn)
end

-- Finally, show a notification that we finished loading the config successfully
notify.new({title = 'Hammerspoon', informativeText = 'Config loaded'}):send()
