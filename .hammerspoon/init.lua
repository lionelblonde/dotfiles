local application = require "hs.application"
local fnutils = require "hs.fnutils"
local grid = require "hs.grid"
local hotkey = require "hs.hotkey"
local window = require "hs.window"

-- Screens
local internal_display = "Color LCD"
local ultrawide_home = "Acer X34A"
local ultrawide_office = "DELL U3417W"
local screen1 = hs.screen.allScreens()[1]
local screen2 = hs.screen.allScreens()[2]

-- Set up the grid
hs.grid.setMargins("1, 1")
hs.grid.setGrid("2x1", "Color LCD")
hs.grid.setGrid("1x4", "1080x1920")
hs.grid.setGrid("1x4", "1050x1680")
hs.grid.setGrid("1x4", "1200x1920")
hs.grid.setGrid("3x1", "3440x1440")

-- Aliases
local hyper = {"control", "shift"}

-- Instant window resizing, none of this animation shit
hs.window.animationDuration = 0

-- Toggle an application between being the frontmost app, and being hidden
function toggle_application(_app)
  local app = hs.appfinder.appFromName(_app)
  local mainwin = app:mainWindow()
  if mainwin then
    if mainwin == hs.window.focusedWindow() then
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
function toggle_window_maximized()
  local win = hs.window.focusedWindow()
  if frameCache[win:id()] then
    win:setFrame(frameCache[win:id()])
    frameCache[win:id()] = nil
  else
    frameCache[win:id()] = win:frame()
    win:maximize()
  end
end

-- Press Command-q twice to quit an application
local quit_modal = hs.hotkey.modal.new('cmd','q')
local waiting_time = 1.5

function quit_modal:entered()
    hs.alert.show("Press Command-Q again to quit", waiting_time)
    hs.timer.doAfter(waiting_time, function() quit_modal:exit() end)
end

function do_quit()
    hs.application.frontmostApplication():kill()
end

quit_modal:bind('cmd', 'q', do_quit)
quit_modal:bind('', 'escape', function() quit_modal:exit() end)

-- Define window layouts
-- Format reminder:
-- {"App name", "Window name", "Display Name", "unitrect", "framerect", "fullframerect"}
local laptop_layout = {
  {"Finder", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Dash", nil, internal_display, hs.layout.left75, nil, nil},
  {"Google Chrome", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Safari", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Mail", nil, internal_display, hs.layout.right70, nil, nil},
  {"PDF Expert", nil, internal_display, hs.layout.left75, nil, nil},
  {"Skim", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Sublime Text", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Notes", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Sketch", nil, internal_display, hs.layout.maximized, nil, nil}
}

-- And now for hotkeys relating to Hyper.
-- First, let's capture all of the functions, then we can just quickly iterate and bind them
hyperfns = {}

-- Hotkey to reload config
hyperfns["x"] = function() hs.reload() end

-- Hotkey to lock the screen
hyperfns["c"] = function() hs.caffeinate.lockScreen() end

-- Hotkey to show grid
hyperfns["g"] = hs.grid.show

-- Hotkeys to trigger defined layouts
hyperfns["1"] = function() hs.layout.apply(laptop_layout) end

-- Hotkeys to move windows accross screens
hyperfns[","] = function() hs.window.focusedWindow():moveOneScreenWest() end
hyperfns["."] = function() hs.window.focusedWindow():moveOneScreenEast() end

-- Hotkeys to resize the windows absolutely
hyperfns["["] = function() hs.window.focusedWindow():moveToUnit(hs.layout.left50) end
hyperfns["]"] = function() hs.window.focusedWindow():moveToUnit(hs.layout.right50) end
hyperfns["="] = toggle_window_maximized

-- Hotkeys to toggle focus on applications
hyperfns["y"] = function() toggle_application("Sketch") end
hyperfns["u"] = function() toggle_application("Finder") end
hyperfns["i"] = function() toggle_application("Terminal") end
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
  hs.hotkey.bind(hyper, _hotkey, _fn)
end

-- Finally, show a notification that we finished loading the config successfully
hs.notify.new({title = 'Hammerspoon', informativeText = 'Config loaded'}):send()
