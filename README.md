# Dotfiles and macOS system setup scripts

## System Preferences

- Go to *Accessibility -> Display* and tick the *Reduce transparency* box.
- Go to *Dock -> Prefer tabs when opening documents* and select *Always*.
* Go to *Keyboard ->  Touch Bar shows* and select *Expanded Control Strip*.
* Go to *Extensions -> Finder Extensions* and disable Dropbox and Google Drive Finder extensions.

## Hidden settings (redundant if using TinkerTool)

- Enable key repeat:
`defaults write -g ApplePressAndHoldEnabled -bool false`
- Change the time in seconds it takes for the Dock to reappear fully:
`defaults write com.apple.dock autohide-time-modifier -float 0.15`
Followed by `killall Dock` for this change to properly take effect.
To restore the Dock appearance to its original setting, use
`defaults delete com.apple.dock autohide-time-modifier;killall Dock`.

## Homebrew

1. Install Homebrew
```bash
/usr/bin/ruby -e \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
2. Get the complete history
```bash
git -C "$(brew --repo homebrew/core)" fetch --unshallow
```
3. Install the Homebrew packages
`./brew.sh`

## TinkerTool

* Download and install TinkerTool from `https://www.bresink.com/osx/TinkerTool.html`.
* Download and install Music Widget from `https://marioaguzman.github.io/musicwidget/`

## Mac App Store

* Microsoft Word (installing via the Mac App Store to avoid the incredibly annoying Microsoft Update overly-frequent pop-ups)
* Things 3
* Hush (Safari extension)
* Wipr (Safari extension)
* Notability
* Simple Comic
* OwlOCR
* Audiobook Binder

## Finder preferences

Do not show anything on the desktop.

## Zsh

1. Ensure `zsh` has been properly installed by running `brew install zsh`
2. Add the line `/usr/local/bin/zsh` to `/etc/shells` (need `sudo` to write)
3. Swap default shell: `chsh -s /usr/local/bin/zsh`
4. Install [*oh-my-zsh*](https://ohmyz.sh)
```bash
sh -c "$(curl -fsSL \
    https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
5. Install the [*spaceship-prompt*](https://github.com/denysdovhan/spaceship-prompt) ZSH theme
```bash
git clone https://github.com/denysdovhan/spaceship-prompt.git \
    "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
    "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
6. Install the [*zsh-syntax-highlighting*](https://github.com/zsh-users/zsh-syntax-highlighting)
ZSH plugin.
Install instructions
[here](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md).
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Symlinks

Create symbolic links to reference the dotfiles outside the repository by running
`./symlink.sh`

## Vim plugin manager

1. Ensure `neovim` has been properly installed by running `brew install neovim`
2. Ensure the file `$HOME/.config/nvim/init.vim` exists
2. Install the [*vim-plug*](https://github.com/junegunn/vim-plug) Vim plugin manager
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
3. Open any file with the `nvim` command (or `vim` if already aliased) and type
`:PlugInstall` to install the vim plugins indicated in the `.vimrc` config.

## Python

1. Download and install the latest version of *Miniconda*.
The available versions are visible [*here*](https://repo.anaconda.com/miniconda/).
```bash
cd && curl -L -O  https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
chmod 777 -R /anaconda3
```
2. In the base environment, install `flake8`
```bash
pip install flake8
# Verify that the following command ouputs `~/miniconda3/bin/flake8`,
# with `~` substituted with the full path.
which flake8
```
3. Create a complete python environment align with my current needs
```bash
conda create -n pytorch-rl python=3.7
conda activate pytorch-rl
# >>>> PyTorch
pip install --upgrade pip
pip install --upgrade pytest pytest-instafail flake8 wrapt six tqdm pyyaml psutil cloudpickle tmuxp lockfile
pip install --upgrade numpy pandas scipy scikit-learn h5py matplotlib
pip install --upgrade pyvips scikit-image
pip install --upgrade torch torchvision
conda install -y -c conda-forge pillow opencv pyglet pyopengl mpi4py cython patchelf
# >>>> wandb
conda install -y -c conda-forge watchdog
pip install moviepy imageio
pip install wandb
# >>>> MuJoCo
brew install gcc@8
cd && mkdir -p .mujoco && cd .mujoco
curl -O https://www.roboti.us/download/mujoco200_macos.zip
unzip mujoco200_macos.zip
mv mujoco200_macos mujoco200
# >>>> Editable-mode packages
cd ~/Code
git clone https://github.com/openai/mujoco-py.git
pip install -e mujoco-py
git clone https://github.com/openai/gym.git
pip install -e 'gym[all]'
git clone https://github.com/deepmind/pycolab
pip install -e pycolab
```

## Lua

Install the prefered Lua linter
```bash
luarocks install luacheck
```

## Brave/Chromium

### Extensions

* QuicKey
* uBlock Origin
* Save to Pocket
* Session Buddy
* Video Speed Controller
* Paperpile
* arxiv-utils
* 1Password
* Decentraleyes
* LeechBlock
* Pinboard Pro

### Settings

In the preferred search engines menu,
add a search engine to search in the bookmarks by mapping the keyword `b` to the url
`brave://bookmarks/?q=%s`.

## Sublime Text

1. Create a command to launch Sublime Text from the terminal
```bash
ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl`
```
2. Install the packages
    * SublimeLinter
    * SublimeLinter-annotations
    * SublimeLinter-flake8
    * SublimeLinter-luacheck
    * Neon Color Scheme
    * FileIcons Mono
    * NeoVintageous
    * MarkdownPreview
    * LaTeXTools
    * Color Highlight
    * TabNine
    * Dotfiles Syntax Highlighting
3. Populate the general settings (`CMD + ,`) with
```bash
{
    "always_show_minimap_viewport": true,
    "auto_complete": false,
    "bold_folder_labels": true,
    "caret_style": "phase",
    "close_windows_when_empty": true,
    "color_scheme": "Packages/Neon Color Scheme/Neon.tmTheme",
    "detect_indentation": false,
    "draw_minimap_border": true,
    "ensure_newline_at_eof_on_save": true,
    "fade_fold_buttons": false,
    "figlet_font": "slant",
    "font_size": 11,
    "highlight_line": false,
    "highlight_modified_tabs": true,
    "ignored_packages":
    [
        "Makefile",
        "Six",
        "Vintage",
        "Vintageous"
    ],
    "indent_to_bracket": true,
    "margin": -2,
    "neovintageous_build_version": 11100,
    "overlay_scroll_bars": "system",
    "rulers": [100],
    "shift_tab_unindent": true,
    "show_errors_inline": false,
    "show_full_path": true,
    "spell_check": false,
    "theme": "Adaptive.sublime-theme",
    "translate_tabs_to_spaces": true,
    "trim_trailing_white_space_on_save": true,
    "use_tab_stops": true,
    "vintage_start_in_command_mode": true,
    "vintageous_use_ctrl_keys": null,
    "vintageous_use_super_keys": null,
    "word_wrap": false,
}
```
4. Populate the *A File Icon* package settings with
```bash
{
   "color": "#fff",
   "row_padding": [4, 1],
   "size": 6
}
```
5. Configure *SublimeLinter* with
```bash
// SublimeLinter Settings - User
{
    "debug": true,
    "lint_mode": "load_save",
    "linters": {
        "luacheck": {
            "executable": "/usr/local/bin/luacheck"
        },
        "flake8": {
            "args": "--max-line-length=100",
            "executable": "~/miniconda3/bin/flake8"
        }
    }
}
```
6. Click on the *Switch Panel* icon (bottom left of the window) and select
*Output: SublimeLinter* to see the linter's output at all times
(errors, warnings and annotations).
