# Source .bashrc
[[ -f ~/.bashrc ]] && source ~/.bashrc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/mambaforge/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/mambaforge/base/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/mamba.sh" ]; then
    . "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

source /Users/lionelblonde/.config/broot/launcher/bash/br
