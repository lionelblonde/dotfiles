#!/usr/bin/env bash

# Create symlinks (careful, overrides old dotfiles)
ln -svf $HOME/Documents/dotfiles/.aliases $HOME/.aliases
ln -svf $HOME/Documents/dotfiles/.bash_profile $HOME/.bash_profile
ln -svf $HOME/Documents/dotfiles/.bashrc $HOME/.bashrc
ln -svf $HOME/Documents/dotfiles/.condarc $HOME/.condarc
cd $HOME/.config && mkdir -p nvim
ln -svf $HOME/Documents/dotfiles/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -svf $HOME/Documents/dotfiles/.gitconfig $HOME/.gitconfig
cd $HOME
mkdir -p .hammerspoon
ln -svf $HOME/Documents/dotfiles/.hammerspoon/init.lua $HOME/.hammerspoon/init.lua
ln -svf $HOME/Documents/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -svf $HOME/Documents/dotfiles/.vimrc $HOME/.vimrc
ln -svf $HOME/Documents/dotfiles/.prompt.conf $HOME/.prompt.conf
ln -svf $HOME/Documents/dotfiles/.zshrc $HOME/.zshrc
ln -svf $HOME/Documents/dotfiles/.ytdlp.conf $HOME/.ytdlp.conf
ln -svf $HOME/Documents/dotfiles/sublime/Preferences.sublime-settings \
    "$HOME/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings"
ln -svf $HOME/Documents/dotfiles/sublime/SublimeLinter.sublime-settings \
    "$HOME/Library/Application Support/Sublime Text/Packages/User/SublimeLinter.sublime-settings"
ln -svf $HOME/Documents/dotfiles/sublime/.neovintageousrc \
    "$HOME/Library/Application Support/Sublime Text/Packages/User/.neovintageousrc"
