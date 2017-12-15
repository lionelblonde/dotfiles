" My vimrc
" Author: Lionel Blonde
" For more information type :help followed by the command.

" Plugins handled by vim-plug
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" On-demand loading
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'dracula/vim'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'scrooloose/nerdcommenter'
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Add plugins to &runtimepath
call plug#end()

" Commands
" PlugInstall [name ...] [#threads] -> Install plugins
" PlugUpdate [name ...] [#threads] -> Install or update plugins
" PlugClean[!] -> Remove unused directories (bang version will clean without prompt) 
" PlugUpgrade -> Upgrade vim-plug itself
" PlugStatus -> Check the status of plugins
" PlugDiff -> Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path] -> Generate script for restoring the current snapshot of the plugins

" Put the non-Plugin stuff after this line

set termguicolors

" Set the maximum length of a line
set textwidth=100

" Leader mapping
map <Space> <leader>

" NERDCOmmenter plugin config 
let NERDSpaceDelims=1
map <leader>;; <plug>NERDCommenterToggle

" Tabulations, spaces and indents rules
" Show existing tab with 4 spaces width
set tabstop=4
" When indenting with '>', use 4 spaces width
set shiftwidth=4
" Sets the number of columns for a tab
set softtabstop=4
" On pressing tab, insert 4 spaces
set expandtab

set wildmenu
set wildmode=list:longest,full

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
endif

" Define colorscheme provided as plugin
" colorscheme dracula
set background=dark
colorscheme spacemacs-theme

set laststatus=2 " to make airline appear all the time
let g:airline_powerline_fonts=1

" To prevent myself from using the arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Hybrid line number mode
" Since Vim 7.4, you can enable both the number and relativenumer settings at the same time, 
" which will give you something I'll call hybrid line number mode
set relativenumber
set number
set numberwidth=3

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Next line is commented since a cursor guide already in use in iTerm is ported in vim as well
set cursorline

" Nerdtree-related tweaks
" Sets a keybind to toggle the Nerdtree view
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open a NERDTree automatically when vim starts up if no files were specified
" Nota bene: start vim with plain vim, not vim .
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
