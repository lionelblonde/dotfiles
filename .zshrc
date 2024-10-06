# zsh config

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

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
# zle -N edit-command-line
# bindkey '^xe' edit-command-line
# bindkey '^x^e' edit-command-line
# Vi style:
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Necessary for conda envs to work in tmux
[[ -z $TMUX ]] || mamba deactivate; mamba activate base

# Configure the liquidprompt prompt
if [ -f /opt/homebrew/share/liquidprompt ]; then
    . /opt/homebrew/share/liquidprompt
fi

# Configure the zsh-syntax-highlighting plugin (N.B. path to the executable found by digging)
source /opt/homebrew/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /Users/lionelblonde/.config/broot/launcher/bash/br
