#!/usr/bin/env bash

# Create symlinks (careful, overrides old dotfiles)
ln -svf $HOME/dotfiles/.aliases $HOME/.aliases
ln -svf $HOME/dotfiles/.bash_profile $HOME/.bash_profile
ln -svf $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -svf $HOME/dotfiles/.condarc $HOME/.condarc
ln -svf $HOME/dotfiles/.config/karabiner/karabiner.json $HOME/.config/karabiner/karabiner.json
ln -svf $HOME/dotfiles/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -svf $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -svf $HOME/dotfiles/.hammerspoon/init.lua $HOME/.hammerspoon/init.lua
ln -svf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -svf $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -svf $HOME/dotfiles/.zshrc $HOME/.zshrc
