#!/usr/bin/env bash

# Run brew installer
./brew.sh
echo "brew utils and apps successfully installed"

# Create symlinks
./symlink.sh
echo "symlinks successfully created"

# Run sublime installer
./sublime.sh
echo "sublime text settings successfully set"

# Install vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Download plugins following: https://github.com/junegunn/vim-plug#commands"
