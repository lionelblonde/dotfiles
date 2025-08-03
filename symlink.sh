#!/usr/bin/env bash

# create symlinks (careful with overrides)

DOTFILES="$HOME/Documents/git/code/ego/github/public/dotfiles"

ln -svf $DOTFILES/.aliases $HOME/.aliases
ln -svf $DOTFILES/.bash_profile $HOME/.bash_profile
ln -svf $DOTFILES/.bashrc $HOME/.bashrc

cd $HOME/.config && mkdir -p nvim
ln -svf $DOTFILES/.config/nvim/init.lua $HOME/.config/nvim/init.lua

cd $HOME
mkdir -p .hammerspoon
ln -svf $DOTFILES/.hammerspoon/init.lua $HOME/.hammerspoon/init.lua

ln -svf $DOTFILES/.gitconfig $HOME/.gitconfig
ln -svf $DOTFILES/.tmux.conf $HOME/.tmux.conf
ln -svf $DOTFILES/.zshrc $HOME/.zshrc
ln -svf $DOTFILES/.zprofile $HOME/.zprofile
ln -svf $DOTFILES/.ytdlp.conf $HOME/.ytdlp.conf
ln -svf $DOTFILES/tmux_sessionizer.sh $HOME/tmux_sessionizer.sh

# vim
ln -svf $DOTFILES/term.vim $HOME/.config/nvim/colors/term.vim
