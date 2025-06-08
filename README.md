# Dotfiles and macOS system setup scripts

## System Preferences
+ Go to _Accessibility -> Pointer Control -> Mouse & Trackpad -> Trackpad Options..._
    + there, select _Enable dragging_ with the _without drag lock_ option.
+ Go to _Accessibility -> Display_ and in the main settings
    + switch on _Reduce motion_, __Differentiate without color__, and __Reduce transparency__.
+ Go to _Trackpad_ and set up App Expose with three-finger swipe down as gesture.
+ Go to _Keyboard -> Keyboard Shortcuts... -> Mission Control_ and assign F10 to _Application windows_.

## More hidden settings
+ Change hidden settings from the command line
    + Decrease the key repeat delays even further:
        + `defaults write -g ApplePressAndHoldEnabled -bool false`
        + `defaults write -g InitialKeyRepeat -int 10`
        + `defaults write -g KeyRepeat -int 1`
    + Change the time it takes for the Dock to appear (this time is in seconds):
        + `defaults write com.apple.Dock autohide-time-modifier -int 0`
        + `defaults write com.apple.Dock autohide-delay -int 0`
        + `killall Dock` to have those changes take effect
        + To restore the Dock's appearance to its original setting, use the following command
            + `defaults delete com.apple.Dock autohide-time-modifier`
            + `defaults delete com.apple.Dock autohide-delay`
            + `killall Dock`
    + Disable window creation animations
        + `defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO`
        + To restore the original behavior, i.e. turn the "scale up" animations back on again
            + `defaults delete NSGlobalDomain NSAutomaticWindowAnimationsEnabled`
+ Setup the following shortcuts for various Spotlight-like apps:
    + `control + :`: trigger TRex
    + `control + '`: trigger Maccy

## Homebrew
1. Install __Homebrew__ by following the instructions at [this link](https://brew.sh/) _including_ the __Cask__ utility
2. Run the install script `brew.sh`

## Mac App Store
Install these apps from the Mac App Store:
+ Microsoft Word, Excel, PowerPoint (installation via the Mac App Store alleviates Microsoft Update pop-ups)
+ Hand Mirror
+ DaisyDisk
+ HEIC Converter (Sindre)
+ Photo Widget (Sindre)
+ Text Lens (Sindre)
+ One Task (Sindre)

## Symlinks
Create symbolic links to reference the dotfiles outside the repository by running `./symlink.sh`.

## Karabiner
In _Function Keys -> For all devices_, set:
+ F1 to "display brightness decrement"
+ F2 to "display brightness increment"
+ F3 to "mission control"
+ F4 to "f10"
+ F5 to "f5"
+ F6 to "f6"
+ F7 to "rewind"
+ F8 to "play or pause"
+ F9 to "fast forward"
+ F10 to "mute"
+ F11 to "volume decrement"
+ F12 to "volume increment"
