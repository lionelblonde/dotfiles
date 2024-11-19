#!/usr/bin/env bash

# Create symlinks (careful, overrides old dotfiles)

# NOTE: Sublime Text does not get set up with symlinks, because packages might change location every update

# Misc
ln -svf $HOME/Documents/dotfiles/.aliases $HOME/.aliases
ln -svf $HOME/Documents/dotfiles/.bash_profile $HOME/.bash_profile
ln -svf $HOME/Documents/dotfiles/.bashrc $HOME/.bashrc
cd $HOME/.config && mkdir -p nvim
ln -svf $HOME/Documents/dotfiles/.config/nvim/init.lua $HOME/.config/nvim/init.lua
ln -svf $HOME/Documents/dotfiles/.gitconfig $HOME/.gitconfig
cd $HOME
mkdir -p .hammerspoon
ln -svf $HOME/Documents/dotfiles/.hammerspoon/init.lua $HOME/.hammerspoon/init.lua
ln -svf $HOME/Documents/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -svf $HOME/Documents/dotfiles/.vimrc $HOME/.vimrc
ln -svf $HOME/Documents/dotfiles/.zshrc $HOME/.zshrc
ln -svf $HOME/Documents/dotfiles/.ytdlp.conf $HOME/.ytdlp.conf
ln -svf $HOME/Documents/dotfiles/tmux_sessionizer.sh $HOME/tmux_sessionizer.sh

# kitty
ln -svf $HOME/Documents/dotfiles/.config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -svf $HOME/Documents/dotfiles/.config/kitty/ssh.conf $HOME/.config/kitty/ssh.conf
