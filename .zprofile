# Configure Homebrew (so /opt/homebrew/bin is in PATH)
eval "$(/opt/homebrew/bin/brew shellenv)"
# This is necessary on Apple Silicon Macs because
# Homebrew is no longer in /usr/local but in /opt/homebrew

# Configure pyenv for login shell
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
