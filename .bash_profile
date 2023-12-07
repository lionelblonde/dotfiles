# Source .bashrc
[[ -f ~/.bashrc ]] && source ~/.bashrc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/lionelblonde/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

source /Users/lionelblonde/.config/broot/launcher/bash/br
