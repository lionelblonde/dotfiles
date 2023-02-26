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
    + _Why are these files (apps) protected?_ The Karabiner system of apps is a system-wide software, and files are
      installed at appropriate locations besides the Application folder. If you just put the application icon in Trash
      like a normal app uninstall, some files will be left behind. The file protection forces to use the built-in 
      uninstaller, which removes the installed files tied to the Karabiner system properly when one uninstalls.
    + This file locking is achieved with `schg` and `uchg` flags.
    + One can unlock the locked application files with the following commands:
        + `sudo chflags nouchg,noschg /Applications/Karabiner-Elements.app`
        + `sudo chflags nouchg,noschg /Applications/Karabiner-EventViewer.app`
    + Enter the administrator password upon executing these commands in a terminal; the apps should now be unlocked
    + N.B.: __remember to use the built-in uninstaller when one wishes to remove the apps__
+ Install the _Fonts for Apple Platforms_ that are available at [this link](https://developer.apple.com/fonts/)
    + In paticular, make sure to acquire the __New York__ one.

## Homebrew
1. Install __Homebrew__ by following the instructions at [this link](https://brew.sh/) _including_ the __Cask__ utility
2. Run the install script `brew.sh`

## Mac App Store
Install these apps from the Mac App Store:
+ Microsoft Word, Excel, PowerPoint (installation via the Mac App Store alleviates Microsoft Update pop-ups)
+ Pure Paste
+ Things 3 (and hide the sidebar)
+ Infuse
+ DaisyDisk
+ RunCat

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

## OCaml
Run the following (exhaustive: there might be overlaps):
```console
brew install opam
opam init
opam install ocaml-lsp-server
opam install dune
opam install utop
```
The last line installs the OCaml language server protocol library.

Debug log with Sublime Text:
=> do not even try to use Sublime Text for OCaml. VSCodium is far better because of this:
[ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform).
It allows for the choice of OCaml switch through the GUI, and is designed with building tools like `dune` in mind.
The absolute killer feature is that it (VSCodium with the OCaml platform plugin) adds a header to each function
to indicate the signature of the function (e.g. `int -> int -> int list`).

To install Coq (theorem-proving langauge written in OCaml), use: `opam install coq`.

## Lua
Install `luacheck`, the preferred Lua code-linting executable, with `luarocks install luacheck`.

## Rust
1. Use `rustup` (installed) to install the Rust compiler (rustc) and the Rust package manager (cargo): `rustup-init`.
2. Verify that all is well with: `rustc --version`.

## Chromium
Install the following Chrome extensions from the store:
+ uBlock Origin
+ Reader View
+ 1Password – Password Manager
+ enhanced-h264ify
+ Paperpile
+ arxiv-utils
+ Sci-Hub X Now!
+ Session Buddy
+ LeechBlock NG
+ uBlacklist
+ Medium Unlocker
+ Video Speed Controller
+ Old Reddit Redirect
+ Nitter Redirect
+ QuicKey
+ SponsorBlock for YouTube - Skip Sponsorships
+ Return YouTube Dislike
+ Youtube-shorts block
+ Delta for YouTube
+ RYS — Remove YouTube Suggestions

[This one](https://gitlab.com/magnolia1234/bypass-paywalls-chrome-clean#installation) need be downloaded and imported.

## VSCodium
Install the following extensions:
+ Vim from vscodevim
+ OCaml Platform by ocamllabs
+ Whatever is best for Jupyter notebooks (package of extensions)

## Sublime Text and Merge
1. Create a command to launch Sublime Text from the terminal
```bash
ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
ln -sv "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge" /usr/local/bin/smerge
```
2. In Sublime Text, install the following packages using the in-app package manager (that need be installed first):
+ Neon Color Scheme
+ DashDoc
+ FileIcons Mono
+ NeoVintageous
+ ToggleNeoVintageous
+ LaTeXTools
+ Tabnine
+ SublimeLinter
+ SublimeLinter-annotations
+ Breadcrumbs
+ rainbow_csv
+ Switch Window
+ Outline
+ LSP
+ LSP-file-watcher-chokidar
+ LSP-pyright
+ LSP-pylsp
+ LSP-lua
+ LSP-rust-analyzer
+ Julia
+ LSP-julia
+ LSP-json
+ LSP-yaml
+ LSP-metals

## Karabiner
+ In _Simple modifications_, hit _Add item_, and map "eject" to "delete_forward"
+ In _Complex modifications_, hit _Add rule_, and import the item "Modern Space Cadet (rev 3)" form the web interface.
+ In there, also add "Change control key".
+ Once the item has been imported in the Karabiner app, enable the following rules from the imported bundle of rules:
    + "Caps Lock to Escape on single press, Caps Lock on press and hold."
    + "Post escape if left_control is pressed alone." (necessary when using the HHKB)
+ In _Devices -> Advanced -> Disable the build-in keyboard while one of the following selected device is connected_,
  tick the box that says "HHKB Professional \[...\]" (or other desired device)

## QMK
After installing, set it up with `qmk setup`.

## Jupyter
Those are the steps to follow to create a new kernelspec aligned with a conda environment, although this is effectively
obsolete to carry out by hand since vscode/vscodium is capable of changing the kernel directly from conda environments.
+ activate the desired conda environment
+ `pip install jupyter`
+ `pip install ipykernel`
+ `python -m ipykernel install --user --name=<exact conda env name> --display-name="<nicer name for kernelspec>"`
Note, the `--name` flag gives ties the kernelspec to an existing conda environment (it is not the activation that does).

Use `jupyter kernelspec list` to print the list of kernelspecs install on the system.
Use `jupyter kernelspec uninstall my_kernelspec_name` to remove a kernelspec.



