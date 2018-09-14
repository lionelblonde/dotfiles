#!/usr/bin/env bash

# Define icons, colors and artifacts
beer_icon=🍺
python_icon=🐍
green='\033[01;32m'
yellow='\033[01;33m'
reset='\033[00m'
line_sep="##################################################"

# Update brew
echo $line_sep
echo -e "$beer_icon Updating ${yellow}Homebrew${reset}..."
brew upgrade
echo $line_sep
echo -e "$beer_icon Getting newest formulas..."
brew update

# Update conda
echo $line_sep
echo -e "$python_icon Updating ${green}conda${reset}..."
conda update conda
echo $line_sep
echo -e "$python_icon Updating packages of base/root environment..."
conda update anaconda
echo $line_sep
