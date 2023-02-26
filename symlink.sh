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
# Sublime Text and Merge
# Text
ln -svf $HOME/Documents/dotfiles/sublime/text/Preferences.sublime-settings \
    "$HOME/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings"
ln -svf $HOME/Documents/dotfiles/sublime/text/SublimeLinter.sublime-settings \
    "$HOME/Library/Application Support/Sublime Text/Packages/User/SublimeLinter.sublime-settings"
ln -svf $HOME/Documents/dotfiles/sublime/text/.neovintageousrc \
    "$HOME/Library/Application Support/Sublime Text/Packages/User/.neovintageousrc"
ln -svf $HOME/Documents/dotfiles/sublime/text/LSP.sublime-settings \
    "$HOME/Library/Application Support/Sublime Text/Packages/User/LSP.sublime-settings"
ln -svf $HOME/Documents/dotfiles/sublime/text/LSP-pylsp.sublime-settings \
    "$HOME/Library/Application Support/Sublime Text/Packages/User/LSP-pylsp.sublime-settings"
# Merge
ln -svf $HOME/Documents/dotfiles/sublime/merge/Preferences.sublime-settings \
    "$HOME/Library/Application Support/Sublime Merge/Packages/User/Preferences.sublime-settings"
ln -svf $HOME/Documents/dotfiles/sublime/merge/Commit\ Message\ -\ Merge.sublime-settings \
    "$HOME/Library/Application Support/Sublime Merge/Packages/User/Commit Message - Merge.sublime-settings"
ln -svf $HOME/Documents/dotfiles/sublime/merge/Diff\ -\ Merge.sublime-settings \
    "$HOME/Library/Application Support/Sublime Merge/Packages/User/Diff - Merge.sublime-settings"
ln -svf $HOME/Documents/dotfiles/sublime/merge/File\ Mode\ -\ Merge.sublime-settings \
    "$HOME/Library/Application Support/Sublime Merge/Packages/User/File Mode - Merge.sublime-settings"
# kitty
ln -svf $HOME/Documents/dotfiles/.config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

