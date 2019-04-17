" Content from the official vim to nvim section in the nvim reference manual
" Link: https://neovim.io/doc/user/nvim.html#nvim-from-vim

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Source the .vimrc; the file can remain in ~; no symlink needed
source ~/.vimrc
