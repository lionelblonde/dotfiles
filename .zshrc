# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
export DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(safe-paste zsh-syntax-highlighting) #zsh-syntax-highlighting has to be the last item

# User configuration

source $ZSH/oh-my-zsh.sh

# Line added according to the fasd installation instructions
eval "$(fasd --init auto)"

# ZSH uses the KEYTIMEOUT parameter to determine how long to wait (in hundredths of a second)
# for additional characters in sequence. Default is 0.4 seconds.
KEYTIMEOUT=1

# Source the aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# History configuration
# How many lines of history to keep in memory
HISTSIZE=5000
# Where to save history to disk
HISTFILE=~/.zsh_history
# Number of history entries to save to disk
SAVEHIST=5000
# Append history to the history file (no overwriting)
setopt appendhistory
# Share history across terminals
setopt sharehistory
# Immediately append to the history file, not just when a term is killed
setopt incappendhistory
# Prepending a command with a space prevent it from being added to the zsh history
setopt HIST_IGNORE_SPACE

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Terminal (and number of colors)
export TERM=xterm-256color

# Set editor to use by default
export VISUAL=vim
export EDITOR="$VISUAL"

# Enable the use of vi in terminal commands
set -o vi
# Problem: vi mode in bash has a delay when switching from insert mode to command mode
set keyseq-timeout 0.01

# Source the prompt config
[[ -f ~/.prompt.conf ]] && source ~/.prompt.conf

# Have the vi mode indicator in the prompt refresh when changing mode; info at the following link
# https://github.com/spaceship-prompt/spaceship-prompt/blob/master/docs/options.md#vi-mode-vi_mode
eval spaceship_vi_mode_enable

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Necessary for conda envs to work in tmux
[[ -z $TMUX ]] || conda deactivate; conda activate base

# opam configuration
[[ ! -r /Users/lionelblonde/.opam/opam-init/init.zsh ]] || source /Users/lionelblonde/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Secretive Config
export SSH_AUTH_SOCK=/Users/lionelblonde/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

