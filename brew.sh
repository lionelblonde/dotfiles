#!/usr/bin/env bash

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew packages
brew install coreutils
brew install zsh
brew install git
brew install git-lfs
brew install wget
brew install curl
brew install neovim
brew install imagemagick
brew install ffmpeg
brew install htop
brew install tmux
brew install fasd
brew install tree
brew install ssh-copy-id
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
brew cask install appcleaner
brew cask install slack
brew cask install keepingyouawake
brew cask install dozer
brew cask install karabiner-elements
brew cask install hammerspoon
brew cask Install mactex
brew cask install malwarebytes
brew cask install dash
brew cask install paste
brew cask install skim
brew cask install sketch
brew cask install sublime-text
brew cask install sublime-merge
brew cask install google-chrome
brew cask install spotify
brew cask install handbrake
brew cask install xquartz
brew cask install qlmarkdown
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlimagesize

# Install fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro
