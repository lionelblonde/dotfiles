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
+ Install the _Fonts for Apple Platforms_ that are available at [this link](https://developer.apple.com/fonts/)
    + In paticular, make sure to acquire the __New York__ one.
+ Setup the following shortcuts for various Spotlight-like apps:
    + `control + P`: show 1Password's "Quick Access" Spotlight-like menu
    + `control + :`: trigger TRex
    + `control + '`: trigger Maccy
    + `control + T`: trigger tomatobar

## Homebrew
1. Install __Homebrew__ by following the instructions at [this link](https://brew.sh/) _including_ the __Cask__ utility
2. Run the install script `brew.sh`

## Mac App Store
Install these apps from the Mac App Store:
+ Microsoft Word, Excel, PowerPoint (installation via the Mac App Store alleviates Microsoft Update pop-ups)
+ Infuse
+ TextSniper
+ Hand Mirror
+ Overcast
+ Focal & Naim
+ DaisyDisk

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
+ Clone `git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"`
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

## Chromium
Turn on SafeSearch (when using Google as search engine: right-most menu).

Install the following Chrome extensions from the store:
+ Vimium (and setup the search engine to use in settings)
+ arxiv-utils
+ Redirectify
+ uBlock Origin
    + in settings, go to filters, annoyances, and tick every box; this should remove all the cookie pop-ups
+ Paperpile
+ Session Buddy
+ Pinboard Plus
+ Web Archives
+ QuicKey
+ LeechBlock NG
    + in settings, make it so that it displays what need be reminded
+ I still don't care about cookies
+ News Feed Eradicator
+ Refined GitHub
+ Open in Sci-Hub

YouTube-related:
+ Return YouTube Dislike
+ BlockTube
+ SponsorBlock
+ Youtube-shorts block
+ RYS - Remove YouTube Suggestions
+ DeArrow - Better Titles and Thumbnails
+ Video Speed Controller
+ YouTube Mix Blocker

[This one](https://gitlab.com/magnolia1234/bypass-paywalls-chrome-clean#installation) need be downloaded and imported.

## Python
Install Mambaforge, not with Homebrew, but directly by downloading itwith `wget` from
[this official link](https://github.com/conda-forge/miniforge#mambaforge).

In the base environment (and all future python envs), install `pylsp` and `flake8`:
`pip install python-lsp-server` (pylsp, for extending rules not covered yet by ruff)
and `pip install ruff-lsp` (linter)
and `pip install pycodestyle` (linter extension)
but also `pip install pyright` (type checker)
and `pip install beartype` (runtime type checker; ensures type hint are correct)

## Karabiner
+ In _Complex modifications_, hit _Add rule_, and import the item "Modern Space Cadet (rev 3)" form the web interface.
+ In there, also add "Change control key".
+ Once the item has been imported in the Karabiner app, enable the following rules from the imported bundle of rules:
    + "Caps Lock to Escape on single press, Caps Lock on press and hold."
+ In _Devices -> Advanced -> Disable the build-in keyboard while one of the following selected device is connected_,
  tick the box that says "HHKB Professional \[...\]" (or other desired device)
+ In _Function Keys_, _For all devices_, set ("use all F1, F2, etc. keys as standard function keys" is set to False):
    + _f1_ to "display_brightness_decrement"
    + _f2_ to "display_brightness_increment"
    + _f3_ to "mission_control"
    + _f4_ to "f10"
    + _f5_ to "f5"
    + _f6_ to "f6"
    + _f7_ to "rewind"
    + _f8_ to "play_or_pause"
    + _f9_ to "fast_forward"
    + _f10_ to "mute"
    + _f11_ to "volume_decrement"
    + _f12_ to "volume_increment"
N.B.: these depend on the QMK layout.

## Jupyter
Those are the steps to follow to create a new kernelspec aligned with a mamba environment, although this is effectively
obsolete to carry out by hand since vscode/vscodium is capable of changing the kernel directly from mamba environments.
+ activate the desired mamba environment
+ `pip install jupyter`
+ `pip install ipykernel`
+ `python -m ipykernel install --user --name=<exact mamba env name> --display-name="<nicer name for kernelspec>"`
Note, the `--name` flag gives ties the kernelspec to an existing mamba environment (it is not the activation that does).

Use `jupyter kernelspec list` to print the list of kernelspecs install on the system.
Use `jupyter kernelspec uninstall my_kernelspec_name` to remove a kernelspec.

## LaTeX
Setup `vimtex` by following the instructions at [this link](https://dr563105.github.io/blog/skim-vimtex-setup/).

## Apps neither in MAS or Homebrew
From the assets I saved, install:
+ SCR Thumbnail Provider
