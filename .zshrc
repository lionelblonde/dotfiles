# zsh config

# ZSH uses the KEYTIMEOUT parameter to determine how long to wait (in hundredths of a second)
# for additional characters in sequence. Default is 0.4 seconds.
KEYTIMEOUT=1

# Source the aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Source the prompt config
[[ -f ~/.prompt.conf ]] && source ~/.prompt.conf

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

# # Terminal (and number of colors)
# export TERM=xterm-256color
# left here not to make the mistake again: do not set TERM, otherwise it overrides the one set by tmux
# and has the annoying consequence of preventing zsh-syntax-highlighting from being usable from a tmux session!

# Set editor to use by default
export VISUAL=/opt/homebrew/bin/nvim
export EDITOR="$VISUAL"

# Enable the use of vi in terminal commands
set -o vi
# Problem: vi mode in bash has a delay when switching from insert mode to command mode
set keyseq-timeout 0.01

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/lionelblonde/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/lionelblonde/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/lionelblonde/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/lionelblonde/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/lionelblonde/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/lionelblonde/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# Necessary for conda envs to work in tmux
[[ -z $TMUX ]] || mamba deactivate; mamba activate base

# Configure the spaceship prompt
source /opt/homebrew/opt/spaceship/spaceship.zsh

# Configure the zsh-syntax-highlighting plugin (N.B. path to the executable found by digging)
source /opt/homebrew/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
