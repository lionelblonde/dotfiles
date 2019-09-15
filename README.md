# Dotfiles and system setup scripts

## Hidden settings

- Enable key repeat:
`defaults write -g ApplePressAndHoldEnabled -bool false`

## Homebrew

1. Install Homebrew
```
/usr/bin/ruby -e \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
2. Install the Homebrew packages by running
`./brew.sh`

## Zsh

1. Ensure `zsh` has been properly installed by running `brew install zsh`
2. Add the line `/usr/local/bin/zsh` to `/etc/shells` (need `sudo` to write)
3. Swap default shell: `chsh -s /usr/local/bin/zsh`
4. Install [*oh-my-zsh*](https://ohmyz.sh)
```
sh -c "$(curl -fsSL \
    https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
5. Install the [*spaceship-prompt*](https://github.com/denysdovhan/spaceship-prompt) ZSH theme
```
git clone https://github.com/denysdovhan/spaceship-prompt.git \
    "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
    "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
6. Install the [*zsh-syntax-highlighting*](https://github.com/zsh-users/zsh-syntax-highlighting) ZSH plugin.
Install instructions [here](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md).
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Sublime Text

1. Create a command to launch Sublime Text from the terminal
`ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl`
2. Install the packages
    1. Neon Color Scheme
    2. Enlightened Color Scheme
    3. A File Icon
    4. NeoVintageous
    5. MarkdownPreview
    6. MarkdownEditing
    7. LaTeXTools
    8. Conda
3. Populate the general settings (`CMD + ,`) with
```
{
    "always_show_minimap_viewport": true,
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
    "highlight_line": true,
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
    "shift_tab_unindent": true,
    "show_full_path": true,
    "spell_check": false,
    "theme": "Adaptive.sublime-theme",
    "translate_tabs_to_spaces": true,
    "trim_trailing_white_space_on_save": true,
    "use_tab_stops": true,
    "vintage_start_in_command_mode": true,
    "vintageous_use_ctrl_keys": null,
    "vintageous_use_super_keys": null,
    "word_wrap": "true"
}
```
4. Populate the *A File Icon* package settings with
```
{
   "color": "#fff",
   "row_padding": [4, 1],
   "size": 6
}
```

## Symlinks

Create symbolic links to reference the dotfiles outside the repository by running
`./symlink.sh`

## Vim plugin manager

1. Ensure `neovim` has been properly installed by running `brew install neovim`
2. Ensure the file `$HOME/.config/nvim/init.vim` exists
2. Install the [*vim-plug*](https://github.com/junegunn/vim-plug) Vim plugin manager
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
3. Open any file with the `nvim` command (or `vim` if already aliased) and type
`:PlugInstall` to install the vim plugins indicated in the `.vimrc` config.

## Anaconda

1. Download and install the latest version of *Miniconda*.
The available versions are visible [*here*](https://repo.anaconda.com/miniconda/).
```
cd && curl -L -O  https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
chmod 777 -R /anaconda3
```
2. Create a complete python environment align with my current needs
```
conda create -n pytorch-rl python=3.7
conda activate pytorch-rl
pip install --upgrade pip
pip install --upgrade pytest pytest-instafail wrapt six tqdm pyyaml psutil cloudpickle
pip install --upgrade numpy pandas scipy scikit-learn h5py matplotlib
pip install --upgrade pyvips scikit-image
pip install --upgrade torch torchvision visdom
conda install -y -c conda-forge pillow opencv pyglet pyopengl mpi4py cython

git clone https://github.com/openai/mujoco-py.git
pip install -e mujoco-py
git clone https://github.com/openai/gym.git
pip install -e 'gym[all]'

```

## Tmux plugin manager

1. Install `tpm`
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
2. Fetch the plugins using `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugins

## Karabiner

1. Download the *Modern Space Cadet* settings from the rule webpage and enable:
    1. <kbd>shift</kbd> keys become <kbd>(</kbd> / <kbd>)</kbd> when used alone
    2. <kbd>capslock</kbd> sends <kbd>escape</kbd> when used alone
    and <kbd>control</kbd> when used with another key

