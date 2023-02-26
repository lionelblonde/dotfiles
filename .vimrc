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
" Theme Papercolor
" Syntax highlighting, matching rules and mappings for the original Markdown and extensions
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Modern Vim and Neovim filetype and syntax plugin for LaTeX files
Plug 'lervag/vimtex'
" Add sticky scroll functionality
Plug 'wellle/context.vim'
" Plugin for viewing vim and nvim startup event timing information
Plug 'dstein64/vim-startuptime'
" Versatile (files and buffers) fuzzy finder (originated by TJ DeVries)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

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
colo seoul256-light
set background=light
" Force the bg to default to the terminal's bg
hi Normal ctermbg=None
hi LineNr ctermbg=None

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
set textwidth=121
set formatoptions=qrn1
" Set a ruler (same value pls)
set colorcolumn=121
" Set the text width in Goyo (same value pls)
let g:goyo_width = 121

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
command ORA :silent !open -a Typora.app '%:p'
" Add command to open the file with VSCodium
command IUM :silent !open -a VSCodium.app '%:p'

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
" Show hidden files by default
let NERDTreeShowHidden=1

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

" Make coc automatically install the desired extensions
let g:coc_global_extensions = ['coc-tabnine']

" -----------------------------------------------------------------------
" Suggested configuration from https://github.com/neoclide/coc.nvim
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" -----------------------------------------------------------------------

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
let g:vimtex_view_skim_sync=1  " Value 1 allows forward search after every successful compilation
let g:vimtex_view_skim_activate=1  " Value 1 allows change focus to skim after command `:VimtexView` is given
let g:vimtex_quickfix_mode=0
" Uncomment the following to _not_ see style indicators
" set conceallevel=1
let g:tex_conceal='abdmg'

let g:context_enabled = 1

" Find files using Telescope command-line sugar
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope oldfiles<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
