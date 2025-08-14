export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.local/bin:$PATH" # uv tools, user-level shims
export PATH="$HOME/.npm-global/bin:$PATH" # what I use it for in README
export PATH="$PYENV_ROOT/bin:$PATH" # so `pyenv` command is found early
typeset -U path   # zsh: dedupe PATH entries
