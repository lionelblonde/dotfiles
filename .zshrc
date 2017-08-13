# Path to your oh-my-zsh installation.
export ZSH=/Users/lionelblonde/.oh-my-zsh

export TERM=xterm-256color

# Path to anaconda: enables the use of "conda" from anywhere
export PATH="/Users/lionelblonde/anaconda/bin:$PATH"

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
# DISABLE_AUTO_TITLE="true"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fasd zsh-syntax-highlighting) #zsh-syntax-highlighting has to be the last item

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# fasd
eval "$(fasd --init auto)"

# Load pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Source the aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Spaceship zsh theme variables
# Order of entities in the prompt
SPACESHIP_PROMPT_ORDER=(
  char          # Prompt character
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  node          # Node.js section
  ruby          # Ruby section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  venv          # virtualenv section
  pyenv         # Pyenv section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
)

# Prompt
SPACESHIP_PROMPT_SYMBOL="➜"
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_PROMPT_PREFIXES_SHOW=true
SPACESHIP_PROMPT_SUFFIXES_SHOW=true
SPACESHIP_PROMPT_DEFAULT_PREFIX=""
SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "

# Time
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX="("
SPACESHIP_TIME_SUFFIX=") "
SPACESHIP_TIME_FORMAT="%*"
SPACESHIP_TIME_12HR=false
SPACESHIP_TIME_COLOR="cyan"

# Execution time
SPACESHIP_EXEC_TIME_SHOW=false

# User
SPACESHIP_USER_SHOW=true
SPACESHIP_USER_PREFIX=""
SPACESHIP_USER_SUFFIX=""
SPACESHIP_USER_COLOR="yellow"
SPACESHIP_USER_COLOR_ROOT="red"

# Host
SPACESHIP_HOST_SHOW=true
SPACESHIP_HOST_PREFIX="@:("
SPACESHIP_HOST_SUFFIX=") "
SPACESHIP_HOST_COLOR="green"

# Directory
SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_SUFFIX=" "
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_COLOR="blue"

# Git
SPACESHIP_GIT_SHOW=true
SPACESHIP_GIT_PREFIX="git:("
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_GIT_SYMBOL="" # 
# Git branch
SPACESHIP_GIT_BRANCH_SHOW=true
SPACESHIP_GIT_BRANCH_PREFIX=""
SPACESHIP_GIT_BRANCH_SUFFIX=""
SPACESHIP_GIT_BRANCH_COLOR="green"
# Git status
SPACESHIP_GIT_STATUS_SHOW=true
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_STATUS_COLOR="red"
SPACESHIP_GIT_STATUS_UNTRACKED="?"
SPACESHIP_GIT_STATUS_ADDED="+"
SPACESHIP_GIT_STATUS_MODIFIED="!"
SPACESHIP_GIT_STATUS_RENAMED="»"
SPACESHIP_GIT_STATUS_DELETED="✘"
SPACESHIP_GIT_STATUS_STASHED="$"
SPACESHIP_GIT_STATUS_UNMERGED="="
SPACESHIP_GIT_STATUS_AHEAD="⇡"
SPACESHIP_GIT_STATUS_BEHIND="⇣"
SPACESHIP_GIT_STATUS_DIVERGED="⇕"

# Hg
SPACESHIP_HG_SHOW=true
SPACESHIP_HG_PREFIX="hg:("
SPACESHIP_HG_SUFFIX=") "
SPACESHIP_HG_SYMBOL="" # ☿
# Hg branch
SPACESHIP_HG_BRANCH_SHOW=true
SPACESHIP_HG_BRANCH_PREFIX=""
SPACESHIP_HG_BRANCH_SUFFIX=""
SPACESHIP_HG_BRANCH_COLOR="green"
# Hg status
SPACESHIP_HG_STATUS_SHOW=true
SPACESHIP_HG_STATUS_PREFIX=""
SPACESHIP_HG_STATUS_SUFFIX=""
SPACESHIP_HG_STATUS_COLOR="red"
SPACESHIP_HG_STATUS_UNTRACKED="?"
SPACESHIP_HG_STATUS_ADDED="+"
SPACESHIP_HG_STATUS_MODIFIED="!"
SPACESHIP_HG_STATUS_DELETED="✘"

# Venv
SPACESHIP_VENV_SHOW=true
SPACESHIP_VENV_PREFIX="venv:("
SPACESHIP_VENV_SUFFIX=") "
SPACESHIP_VENV_COLOR="cyan"

# Version indication
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_VI_MODE_SHOW=false

# Docker version and container name
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_PREFIX=""
SPACESHIP_DOCKER_SUFFIX=" "
SPACESHIP_DOCKER_SYMBOL="🐳 "
SPACESHIP_DOCKER_COLOR="cyan"
