# Configure Homebrew (so /opt/homebrew/bin is in PATH)
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
# This is necessary on Apple Silicon Macs because
# Homebrew is no longer in /usr/local but in /opt/homebrew

# Configure pyenv for login shell
# (completions & shims for interactive shells still go in ~/.zshrc via: eval "$(pyenv init -)")
if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi
