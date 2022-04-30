# Dotfiles and macOS system setup scripts

## System Preferences
+ Go to _Accessibility -> Pointer Control -> Mouse & Trackpad -> Trackpad Options..._ and select _Enable dragging_ with
  the _without drag lock_ option.
+ Go to _General-> Prefer tabs_ and select _never_.
+ Go to _Keyboard ->  Touch Bar shows_ and select _Expanded Control Strip_.

## More hidden settings
+ Install __TinkerTool__ by following the instructions at [this link](https://www.bresink.com/osx/TinkerTool.html).
+ The following setting are redundant if we are already using TinkerTool; here for legacy purposes
    + Enable key repeat: `defaults write -g ApplePressAndHoldEnabled -bool false`
    + Change the time it takes for the Dock to reappear fully; this time is in seconds
        1. `defaults write com.apple.dock autohide-time-modifier -float 0.15` to make the change
        2. `killall Dock` for this change to properly take effect
        0. To restore the Dock's appearance to its original setting, use the following command
            + `defaults delete com.apple.dock autohide-time-modifier;killall Dock`
+ Unlock the Karabiner apps, which are protected from deletion by default (a lock indicator is shown on the app icons)
    + N.B.: this only makes sense (and not even remotely necessary even then) if one wants to replace the app icons
    + _Why are these files [apps] protected?_ The Karabiner system of apps is a system-wide software, and files are
      installed at appropriate locations besides the Application folder. If you just put the application icon in Trash
      like a normal app uninstall, some files will be left behind. The file protection forces to use the built-in 
      uninstaller, which removes the installed files tied to the Karabiner system properly when one uninstalls.
    + This file locking is achieved with `schg` and `uchg` flags.
    + One can unlock the locked application files with the following commands:
        + `sudo chflags nouchg,noschg /Applications/Karabiner-Elements.app`
        + `sudo chflags nouchg,noschg /Applications/Karabiner-EventViewer.app`
    + Enter the administrator password upon executing these commands in a terminal; the apps should now be unlocked
    + N.B.: __remember to use the built-in uninstaller when one wishes to remove the apps__
+ Install __SCR Thumbnail Provider__ from [this link](https://smartcomicreader.com/thumbnailprovider/).
    + _What_ it does and _why_ it is a great little utility are both questions answered at the above link.

## Homebrew
1. Install __Homebrew__ by following the instructions at [this link](https://brew.sh/) _including_ the __Cask__ utility
2. Run the install script `brew.sh`

## Mac App Store
Install these apps from the Mac App Store:
+ Microsoft Word and Excel (installation via the Mac App Store alleviates Microsoft Update pop-ups)
+ Things 3
+ Mp3tag

Install __only__ if not using Safari as primary browser:
+ Wipr (Safari extension)

## Finder preferences
Do not show anything on the desktop.

## Zsh
1. Ensure `zsh` has been properly installed by running `brew install zsh`
2. Add the line `/usr/local/bin/zsh` to `/etc/shells` (need `sudo` to write)
3. Swap default shell: `chsh -s /usr/local/bin/zsh`
4. Install [`oh-my-zsh`](https://ohmyz.sh)
```bash
sh -c "$(curl -fsSL \
    https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
5. Install the [`spaceship-prompt`](https://github.com/denysdovhan/spaceship-prompt) ZSH theme
```bash
git clone https://github.com/denysdovhan/spaceship-prompt.git \
    "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
    "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
6. Install the [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting) ZSH plugin.
   Install instructions [here](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md).
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Symlinks
Create symbolic links to reference the dotfiles outside the repository by running `./symlink.sh`.

## Vim
1. (Ensure `neovim` has been properly installed by running `brew install neovim`)
2. Ensure the file `$HOME/.config/nvim/init.vim` exists
3. Install the [`vim-plug`](https://github.com/junegunn/vim-plug) Vim plugin manager
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
4. Open any file with the `nvim` command (or `vim` if already aliased) and type `:PlugInstall` to install the vim
   plugins already typed out in the recovered version-controlled `.vimrc` configuration.
5. Verify that the completion package(s) specified in the `.vimrc` configuration is (are) installed; otherwise, do it
   manually with `:CocInstall coc-tabnine`. It is necessary to operate via the either a global variable or directly via
   the above command to benefit from automatic update support.

## Python
1. (Ensure `miniforge` has been properly installed by running `brew install miniforge`)
2. In the base Anaconda/conda/miniforge environment, install the PEP-8 rule-checking package `flake8` with the command
   `pip install flake8`, and finally verify that the installed executable is first in the PATH with `which flake8`

## Lua
Install `luacheck`, the preferred Lua code-linting executable, with `luarocks install luacheck`

## Chromium
Install the following Chrome extensions:
+ uBlock Origin
+ Reader View
+ enhanced h264ify
+ Video Speed Controller
+ Paperpile
+ arxiv-utils
+ Delta for YouTube
+ LeechBlock NG
+ Session Buddy
+ Old Brave Dark Theme
+ Unhook - Remove YouTube Recommended Videos
+ Return YouTube Dislike
+ Sci-Hub X Now!
+ SponsorBlock for YouTube - Skip Sponsorships
+ QuicKey – The quick tab switcher
+ Soundcloud Download
+ BetterTTV
+ High Resolution Downloader for Instagram

## iTerm
+ In the preferences, go to _Profiles -> Keys -> General_ and change the setting _Left Option Key_ to _Esc+_.
  This will have the effect of enabling the use of the _meta_ modifier (option/alt) in the terminal emulator.
+ In the preferences, go to _General -> Window_ and make sure that "Adjust window when changing font size" is off

## Sublime Text and Merge
1. Create a command to launch Sublime Text from the terminal
```bash
ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
ln -sv "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge" /usr/local/bin/smerge
```
2. In Sublime Text, install the following packages using the in-app package manager (that need be installed first):
+ SublimeLinter
+ SublimeLinter-annotations
+ SublimeLinter-flake8
+ SublimeLinter-luacheck
+ Neon Color Scheme
+ FileIcons Mono
+ NeoVintageous
+ ToggleNeoVintageous
+ LaTeXTools
+ Typora Markdown App (OSX)
+ Tabnine

