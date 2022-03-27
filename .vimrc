" My vimrc
" Author: Lionel Blonde
" For more information type :help followed by the command.

" Plugins handled by vim-plug
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" On-demand loading
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Theme seoul 256
Plug 'junegunn/seoul256.vim'
" Markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'
" Hyperfocus-writing in Vim
Plug 'junegunn/limelight.vim'
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

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
endif

" Define colorscheme provided as plugin
set background=dark
colorscheme seoul256

" Get airline to work at startup
set laststatus=2 

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

" Highlight the current line in every window and update the highlight as the cursor moves
set cursorline

" Disable folding in Markdown (setting of the installed extra package)
let g:vim_markdown_folding_disabled = 1

" Add command to open the file with Sublime Text
command Sublime :silent !open -a Sublime\ Text.app '%:p'
" Add command to open the file with Typora
command Typora :silent !open -a Typora.app '%:p'

" Nerdtree-related tweaks
" Sets a keybind to toggle the Nerdtree view
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open a NERDTree automatically when vim starts up if no files were specified
" Nota bene: start vim with plain vim, not vim .
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
