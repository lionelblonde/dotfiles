local application = require "hs.application"
local fnutils = require "hs.fnutils"
local grid = require "hs.grid"
local hotkey = require "hs.hotkey"
local window = require "hs.window"

-- Screens
local internal_display = "Color LCD"
local left_screen = hs.screen.allScreens()[1]
local right_screen = hs.screen.allScreens()[2]

-- Set up the grid
hs.grid.setMargins("0, 0")
hs.grid.setGrid("4x2", "Color LCD")
hs.grid.setGrid("1x4", "1080x1920")
hs.grid.setGrid("1x4", "1050x1680")
hs.grid.setGrid("2x4", "1200x1920")

-- Aliases
local hyper = {"ctrl", "shift"}

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

-- Toggle a window between its normal size, and being maximized
local frameCache = {} --reset the cache
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

-- Define window layouts
-- Format reminder:
-- {"App name", "Window name", "Display Name", "unitrect", "framerect", "fullframerect"}
local single_monitor_layout = {
  {"Emacs", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Code", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Dash", nil, internal_display, hs.layout.maximized, nil, nil},
  {"iTunes", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Google Chrome", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Spotify", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Mail", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Skype", nil, internal_display, hs.layout.right30, nil, nil},
  {"Finder", nil, internal_display, hs.layout.right50, nil, nil},
  {"iTerm2", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Messages", nil, internal_display, hs.geometry.unitrect(1/2, 1/2, 1/2, 1/2), nil, nil},
  {"WhatsApp", nil, internal_display, hs.geometry.unitrect(0, 1/2, 1/2, 1/2), nil, nil},
  {"Skim", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Calendar", nil, internal_display, hs.layout.maximized, nil, nil},
  {"Sublime Text", nil, internal_display, hs.layout.maximized, nil, nil}
}

local dual_monitor_layout = {
  {"Emacs", nil, right_screen, hs.geometry.unitrect(0, 0, 1, 65/100), nil, nil},
  {"Code", nil, right_screen, hs.layout.maximized, nil, nil},
  {"Dash", nil, left_screen, hs.layout.maximized, nil, nil},
  {"iTunes", nil, left_screen, hs.layout.maximized, nil, nil},
  {"Google Chrome", nil, left_screen, hs.layout.maximized, nil, nil},
  {"Spotify", nil, left_screen, hs.geometry.unitrect(0, 1/4, 1, 3/4), nil, nil},
  {"Mail", nil, left_screen, hs.layout.maximized, nil, nil},
  {"Skype", nil, left_screen, hs.geometry.unitrect(0, 2/3, 1, 1/3), nil, nil},
  {"Finder", nil, right_screen, hs.geometry.unitrect(0, 1/2, 1, 1/2), nil, nil},
  {"iTerm2", nil, right_screen, hs.geometry.unitrect(0, 65/100, 1, 35/100), nil, nil},
  {"Messages", nil, left_screen, hs.geometry.unitrect(0, 2/3, 1, 1/3), nil, nil},
  {"WhatsApp", nil, left_screen, hs.geometry.unitrect(0, 2/3, 1, 1/3), nil, nil},
  {"Skim", nil, left_screen, hs.layout.maximized, nil, nil},
  {"Calendar", nil, left_screen, hs.geometry.unitrect(0, 1/2, 1, 1/2), nil, nil},
  {"Sublime Text", nil, left_screen, hs.layout.maximized, nil, nil}
}

-- And now for hotkeys relating to Hyper.
-- First, let's capture all of the functions, then we can just quickly iterate and bind them
hyperfns = {}

-- Hotkey to reload config
hyperfns["r"] = function() hs.reload() end

-- Hotkey to show grid
hyperfns["g"] = hs.grid.show

-- Hotkey to show window hints
hyperfns["l"] = hs.hints.windowHints

-- Hotkeys to trigger defined layouts
hyperfns["1"] = function() hs.layout.apply(single_monitor_layout) end
hyperfns["2"] = function() hs.layout.apply(dual_monitor_layout) end

-- Hotkeys to move windows accross screens
hyperfns[","] = function() hs.window.focusedWindow():moveOneScreenWest() end
hyperfns["."] = function() hs.window.focusedWindow():moveOneScreenEast() end

-- Hotkeys to resize the windows absolutely
hyperfns["["] = function() hs.window.focusedWindow():moveToUnit(hs.layout.left50) end
hyperfns["]"] = function() hs.window.focusedWindow():moveToUnit(hs.layout.right50) end
hyperfns["="] = toggle_window_maximized

-- Hotkeys to toggle focus on applications
hyperfns["y"] = function() toggle_application("iTunes") end
hyperfns["u"] = function() toggle_application("Finder") end
hyperfns["i"] = function() toggle_application("iTerm2") end
hyperfns["o"] = function() toggle_application("Spotify") end
hyperfns["p"] = function() toggle_application("Dash") end
hyperfns["h"] = function() toggle_application("Mail") end
hyperfns["j"] = function() toggle_application("Google Chrome") end
hyperfns["m"] = function() toggle_application("Messages")end
hyperfns["'"] = function() toggle_application("Skype") end
hyperfns["k"] = function() toggle_application("Emacs") end
hyperfns[";"] = function() toggle_application("Skim") end
hyperfns["n"] = function() toggle_application("Calendar") end


-- Bind all the hotkeys and functions together
for _hotkey, _fn in pairs(hyperfns) do
  hs.hotkey.bind(hyper, _hotkey, _fn)
end

-- Finally, show a notification that we finished loading the config successfully
hs.notify.new({title = 'Hammerspoon', informativeText = 'Config loaded'}):send()
