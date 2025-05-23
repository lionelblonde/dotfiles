# Dotfiles and macOS system setup scripts

## System Preferences
+ Go to _Accessibility -> Pointer Control -> Mouse & Trackpad -> Trackpad Options..._
    + there, select _Enable dragging_ with the _without drag lock_ option.
+ Go to _Accessibility -> Display_ and in the main settings
    + switch on _Reduce motion_, __Differentiate without color__, and __Reduce transparency__.
+ Go to _Trackpad_ and set up App Expose with three-finger swipe down as gesture.
+ Go to _Keyboard -> Keyboard Shortcuts... -> Mission Control_ and assign F10 to _Application windows_.
+ Schedule downtime in Screen Time (both on macOS and iOS) to be between 23:45 and 05:00.

## More hidden settings
+ Change hidden settings from the command line
    + Decrease the key repeat delays even further:
        + `defaults write -g ApplePressAndHoldEnabled -bool false`
        + `defaults write -g InitialKeyRepeat -int 10`
        + `defaults write -g KeyRepeat -int 1`
    + Change the time it takes for the Dock to reappear fully; this time is in seconds
        + What I like to do is force myself not to ever use the Dock: set a long delay for it appearance (5secs).
          It can still be seen instantly and clicked on from Mission Control. The App Switcher shows what's open.
        + `defaults write com.apple.Dock autohide-time-modifier -int 5`
        + `defaults write com.apple.Dock autohide-delay -int 5`
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
    + `control + O`: trigger Dash with seach field selected
    + `control + P`: show 1Password's "Quick Access" Spotlight-like menu
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
+ HEIC Converter
+ Photo Widget
+ Things 3

## Zsh
+ Make sure to only continue here after having run the `brew.sh` script
    + (The `brew.sh` script installs `zsh`, `liquidprompt`, and `zsh-syntax-highlighting`)
+ Add the line `/usr/local/bin/zsh` to `/etc/shells` (need `sudo` to write)
+ Swap default shell: `chsh -s /usr/local/bin/zsh`
+ Make sure `liquidprompt` initialization is done in `.zshrc`
+ Same goes for the `zsh-syntax-highlighting` plugin
+ Source `.zshrc`

Special note: on Ubuntu
+ Start from the `ubuntu/.zshrc` base stored in the dotfiles
+ Run `sudo apt-get install liquidprompt`, followed by 
+ Create a `.zsh` folder at home: `mkdir -p .zsh`
+ Clone 
  `git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"`
+ Add this to `.zshrc`: `source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"`
+ Run `liquidprompt_activate` (this will add the config lines to `.zshrc`)
+ Edit `~/.config/liquidpromptrc`, and switch off the temperature setting
+ Source `.zshrc`

## Tmux
Install Tmux Plugin Manager: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`.
The plugins are to then be installed with `prefix` + `I` (capital `i`).
Instructions at: [this link](https://github.com/tmux-plugins/tpm).

## Symlinks
Create symbolic links to reference the dotfiles outside the repository by running `./symlink.sh`.

## Rust
Just follow the instructions from the [official install page](https://www.rust-lang.org/tools/install).

## Python
Install Miniforge, not with Homebrew, but directly by downloading it with `wget` from
the appropriate link at [the official GitHub page](https://github.com/conda-forge/miniforge#install).
Mambaforge is deprecated as of July 2024.

## Karabiner
+ In _Complex modifications_, hit _Add rule_, and import the item "Modern Space Cadet (rev 3)" form the web interface.
+ In there, also add "Change control key".
+ Once the item has been imported in the Karabiner app, enable the following rules from the imported bundle of rules:
    + "Caps Lock to Escape on single press, Caps Lock on press and hold."
+ In _Devices -> Advanced -> Disable the build-in keyboard while one of the following selected device is connected_,
  tick the box that says "HHKB Professional \[...\]" (or other desired device)
+ In _Function Keys_, _For all devices_, set ("use all F1, F2, etc. keys as standard function keys" is set to False):
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
N.B.: these depend on the QMK layout.
