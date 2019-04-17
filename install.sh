#!/usr/bin/env bash

# Create symlinks
chmod +x symlink.sh
./symlink.sh
echo "symlinks successfully created"

# Run brew installer
chmod +x brew.sh
./brew.sh
echo "brew utils and apps successfully installed"

# Run sublime installer
chmod +x sublime.sh
./sublime.sh
echo "sublime text settings successfully set"

# Install vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Download plugins following: https://github.com/junegunn/vim-plug#commands"
