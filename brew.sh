#!/usr/bin/env bash

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew packages
brew install coreutils
brew install zsh
brew install zsh-syntax-highlighting
brew install git
brew install git-lfs
brew install sshfs
brew install wget
brew install curl
brew install neovim
brew install neofetch
brew install imagemagick
brew install ffmpeg
brew install htop
brew install tmux
brew install fasd
brew install iproute2mac
brew install tree
brew install ssh-copy-id
brew install speedtest-cli
brew install unrar
brew install trash
brew install reattach-to-user-namespace
brew install ruby
brew install lua
brew install luarocks

# Install macOS applications with brew cask
brew cask install istat-menus
brew cask install intel-power-gadget  # https://bjango.com/help/istatmenus6/frequency/
brew cask install muzzle
brew cask install cyberduck
brew cask install iina
brew cask install appcleaner
brew cask install daisydisk
brew cask install slack
brew cask install keepingyouawake
brew cask install tunnelblick
brew cask install hammerspoon
brew cask Install mactex
brew cask install flux
brew cask install malwarebytes
brew cask install dash
brew cask install bartender
brew cask install docker
brew cask install zerotier-one
brew cask install paste
brew cask install skim
brew cask install pdf-expert
brew cask install transmission
brew cask install sketch
brew cask install osxfuse
brew cask install 1password
brew cask install dropbox
brew cask install protonvpn
brew cask install telegram
brew cask install handbrake
brew cask install karabiner-elements
brew cask install google-chrome
brew cask install google-backup-and-sync
brew cask install sublime-text
brew cask install sublime-merge
brew cask install spotify
brew cask install discord
brew cask install skype
brew cask install xquartz
brew cask install qlmarkdown
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlimagesize
brew cask install anaconda

# Install fonts
brew tap homebrew/cask-fonts
brew cask install font-powerline-symbols
brew cask install font-source-code-pro-for-powerline
brew cask install font-menlo-for-powerline
