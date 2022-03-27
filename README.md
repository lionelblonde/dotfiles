# Dotfiles and macOS system setup scripts

## System Preferences

+ Go to _Accessibility -> Display_ and tick the _Reduce transparency_ box.
+ Go to _Dock -> Prefer tabs when opening documents_ and select _Always_.
+ Go to _Keyboard ->  Touch Bar shows_ and select _Expanded Control Strip_.
+ Go to _Extensions -> Finder Extensions_ and disable Dropbox and Google Drive Finder extensions.

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

## Manual Install

+ Download and install TinkerTool from `https://www.bresink.com/osx/TinkerTool.html`.

## Mac App Store

+ Microsoft Word and Excel (installing via the Mac App Store to avoid
the incredibly annoying Microsoft Update overly-frequent pop-ups)
+ Things 3
+ OwlOCR
+ Infuse
+ Mp3tag
+ Notability

Only if not using Safari as primary browser:
+ Wipr (Safari extension)

## Finder preferences

Do not show anything on the desktop.

## Zsh

1. Ensure `zsh` has been properly installed by running `brew install zsh`
2. Add the line `/usr/local/bin/zsh` to `/etc/shells` (need `sudo` to write)
3. Swap default shell: `chsh -s /usr/local/bin/zsh`
4. Install [_oh-my-zsh_](https://ohmyz.sh)
```bash
sh -c "$(curl -fsSL \
    https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
5. Install the [_spaceship-prompt_](https://github.com/denysdovhan/spaceship-prompt) ZSH theme
```bash
git clone https://github.com/denysdovhan/spaceship-prompt.git \
    "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
    "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
6. Install the [_zsh-syntax-highlighting_](https://github.com/zsh-users/zsh-syntax-highlighting)
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
2. Install the [_vim-plug_](https://github.com/junegunn/vim-plug) Vim plugin manager
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
3. Open any file with the `nvim` command (or `vim` if already aliased) and type
`:PlugInstall` to install the vim plugins indicated in the `.vimrc` config.

## Python

1. Download and install the latest version of _Miniconda_.
The available versions are visible [_here_](https://repo.anaconda.com/miniconda/).
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

## Chromium-based browser extensions

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
+ BetterTTV
+ ABSOLUTELY Blank New Tab Page
+ Soundcloud Download
+ Live Reload, from Blaise Kal

## Sublime Text

1. Create a command to launch Sublime Text from the terminal
```bash
ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
ln -sv "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge" /usr/local/bin/smerge
```
2. Install the packages
    + SublimeLinter
    + SublimeLinter-annotations
    + SublimeLinter-flake8
    + SublimeLinter-luacheck
    + Neon Color Scheme
    + FileIcons Mono
    + NeoVintageous
    + LaTeXTools
    + Typora Markdown App (OSX)
    + LiveReload
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
    // "font_face": "Source Code Pro",
    "font_face": "Input Mono",
    // "font_face": "Comic Code",
    // "font_face": "Menlo",
    "font_size": 13,
    "highlight_line": true,
    "highlight_modified_tabs": true,
    "ignored_packages":
    [
        "Makefile",
        "Six",
        "Vintage",
        "Vintageous",
    ],
    "indent_to_bracket": true,
    "margin": -2,
    "neovintageous_build_version": 11100,
    "overlay_scroll_bars": "system",
    "relative_line_numbers": true,
    "rulers":
    [
        120
    ],
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
    "added_words":
    [
        "dataset",
        "optimality",
        "covariate",
        "discretizing",
        "discretized",
    ],
    "update_check": true,
    "dark_theme": "Default Dark.sublime-theme",
    "light_theme": "Default.sublime-theme",
    "dark_color_scheme": "Packages/Neon Color Scheme/Neon.tmTheme",
    "light_color_scheme": "Celeste.sublime-color-scheme",
}

```
4. Configure _SublimeLinter_ with
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
5. Click on the `Switch Panel` icon (bottom left of the window) and select
`Output: SublimeLinter` to see the linter's output at all times
(errors, warnings and annotations).
