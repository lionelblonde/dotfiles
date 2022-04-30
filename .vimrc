" For help, type :help followed by the command.

" Leader mapping
let mapleader=" "

" Plugins handled by vim-plug
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Delete/change/add parentheses/quotes/XML-tags/much more with ease
Plug 'tpope/vim-surround'
" Last line of Tim Pope's `surround.vim` plugin tutorial on github advises the following:
" \" The `.` command will work with `ds`, `cs`, and `yss` if you install `repeat.vim`\"
Plug 'tpope/vim-repeat'
" Complementary pairs of mappings from Tim Pope (crucial: adding newlines)
Plug 'tpope/vim-unimpaired'
" Helper for comments
Plug 'scrooloose/nerdcommenter'
" Tree explorer
Plug 'scrooloose/nerdtree'
" Theme seoul 256
Plug 'junegunn/seoul256.vim'
" Syntax highlighting, matching rules and mappings for the original Markdown and extensions
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Modern Vim and Neovim filetype and syntax plugin for LaTeX files
Plug 'lervag/vimtex'

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

" Source vimrc with <Leader>vc
nnoremap <Leader>vc :source ~/.vimrc<CR>:echo "just reloaded your vimrc; bye."<CR>

" Disable Modeline Magic altogether
" Why? Security reason: prevent Vim from executing arbitrary code
set nomodeline

"Set up spelling
setlocal spell spelllang=en_us
setlocal spell!

" Important: `nnoremap` is the `map` version works non-recursively in normal mode

" Make `Y` behave properly (symmetry w.r.t. `D`)
nnoremap Y y$

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

" When toggling comments with the NERDCommenter plugin,
" ensure that there is a space inserted between the comment symbol and the first letter
let NERDSpaceDelims=1

" Define colorscheme provided as plugin
set background=dark
colorscheme seoul256

" To prevent myself from using the arrow keys
" non-recursively in normal, visual, select and operator pending modes
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
" non-recursively in insert and command-line modes
noremap! <up> <nop>
noremap! <down> <nop>
noremap! <left> <nop>
noremap! <right> <nop>

" Smart search
set ignorecase
set smartcase

" Smart wrapping
set wrap
set textwidth=120
set formatoptions=qrn1
" Set a ruler (same value pls)
set colorcolumn=120
" Set the text width in Goyo (same value pls)
let g:goyo_width = 120

" Search as characters are typed
set incsearch

" Nicer behavior when splitting
set splitbelow splitright

" Make undo persistent across openings and closings of files
set undofile

" Keybindings
" <CR> is a carrige return(?)

" Remove highlighting (no highlight is the idea I am going for here)
nnoremap <leader>nh :noh<CR>
" Toggle Goyo for distraction-free writing in Vim
nnoremap <leader>g :Goyo<CR>
" Turn spelling off or on
nnoremap <leader>s :setlocal spell!<CR>

" Hybrid line number mode
" Since Vim 7.4, you can enable both the number and relativenumer settings at the same time, 
" which will give you something I'll call hybrid line number mode
set relativenumber
set number
set numberwidth=3

" Show the list of open buffers
nnoremap <leader>o :ls<CR>

" Highlight the current line in every window and update the highlight as the cursor moves
set cursorline

" Disable folding in Markdown (setting of the installed package for Markdown)
let g:vim_markdown_folding_disabled = 1

" Add command to open the file with Sublime Text
command ST :silent !open -a Sublime\ Text.app '%:p'
" Add command to open the file with Sublime Merge
command SM :silent !open -a Sublime\ Merge.app '%:p'
" Add command to open the file with Typora
command Typora :silent !open -a Typora.app '%:p'

" Nerdtree-related tweaks
" Set a keybind to toggle the Nerdtree view
nnoremap <C-n> :NERDTreeToggle<CR>
" Set a keybind to show the current file in the Nerdtree view
nnoremap <C-f> :NERDTreeFind<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open a NERDTree automatically when vim starts up if no files were specified
" Nota bene: start vim with plain vim, not vim .
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Goyo-related tweaks
" Ensure `:q` to quit even when Goyo is active
" Function ENTER
function! s:goyo_enter()
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction
" Function LEAVE
function! s:goyo_leave()
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
            qa!
        else
            qa
        endif
    endif
endfunction
" Use the created function to create the commands
autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" Make the yanked region apparent
au TextYankPost * silent! lua vim.highlight.on_yank()

" Open the markdown outline/table of content view in a drawer below
nnoremap <C-c> :Toch<CR>

" Make coc automatically install the desired extensions
let g:coc_global_extensions = ['coc-tabnine']

" Use tab to trigger Coc's completion
" tab cycles through the sugegstions, but does not add more than one word
" CR adds the entire selection even if it contains several words
inoremap <silent> <expr> <tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <s-tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr>    <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Create a function that toggles Coc's linting
function! CocToggle()
    if g:coc_enabled
        CocDisable
    else
        CocEnable
    endif
endfunction
command! CocToggle :call CocToggle()
" Set a keybind to toggle Coc
nnoremap <leader>coc :CocToggle<CR>

" Enable markdown folding
let g:markdown_folding = 1
" When opening a markdown file, the headings up to type '#' are unfolded
au FileType markdown setlocal foldlevel=1

" Configure VimTeX
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
" Uncomment the following to _not_ see style indicators
" set conceallevel=1
let g:tex_conceal='abdmg'

