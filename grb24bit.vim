" grb256 color scheme
" Based on ir_black <http://blog.infinitered.com/entries/show/8>
runtime colors/ir_black.vim

let g:colors_name = "grb256"

" These colors are taken from iTerm2's 'pastel' color scheme. The name of
" 'cyan' is somewhat inaccurate, since it's referring to the color that iTerm2
" assigned to the 16-color-terminal 'cyan' color, rather than true cyan.
" However, the names are at least roughly correct.
let s:black = "#000000"
let s:gray = "#616161"
let s:lightgray = "#8e8e8e"
let s:red = "#ff8272"
let s:lightred = "#ffc4bd"
let s:green = "#b4fa72"
let s:lightgreen = "#d6fcb9"
let s:yellow = "#fefdc2"
let s:lightyellow = "#fefdd5"
let s:blue = "#a5d5fe"
let s:lightblue = "#c1e3fe"
let s:magenta = "#ff8ffd"
let s:lightmagenta = "#ffc5fe" " "#ffb1fe"
let s:cyan = "#d0d1fe"
let s:lightcyan = "#d2d4fd" " "#e5e6fe"
let s:lightercyan = "#e5e6fe"
let s:white = "#f1f1f1"
let s:lightwhite = "#feffff"

let s:none = "NONE"
let s:reverse = "reverse"
let s:bold = "BOLD"
let s:underline = "underline"

" Additional colors.
let s:darkgray = "#202020"
let s:darkred = "#770000"
let s:darkorange = "#773c00"
let s:lightblack = "#474747"

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "grb24bit"


" General colors. Forgive me for the way that all of this is formatted.
exe 'hi Normal          guifg='.s:none          .' guibg='.s:black           .' gui='.s:none
exe 'hi NonText         guifg='.s:lightblack    .' guibg='.s:none           .' gui='.s:none

exe 'hi Cursor          guifg='.s:black         .' guibg='.s:lightwhite     .' gui='.s:reverse
exe 'hi LineNr          guifg='.s:lightgray     .' guibg='.s:none           .' gui='.s:none

exe 'hi VertSplit       guifg='.s:lightgray     .' guibg='.s:lightgray      .' gui='.s:none
exe 'hi StatusLine      guifg='.s:black         .' guibg='.s:white          .' gui='.s:none
exe 'hi StatusLineNC    guifg='.s:black         .' guibg='.s:lightgray      .' gui='.s:none  

exe 'hi Folded          guifg='.s:none          .' guibg='.s:none           .' gui='.s:none
exe 'hi Title           guifg='.s:none          .' guibg='.s:none           .' gui='.s:none
exe 'hi Visual          guifg='.s:none          .' guibg='.s:gray           .' cterm='.s:reverse

exe 'hi SpecialKey      guifg='.s:yellow        .' guibg='.s:none           .' gui='.s:none

exe 'hi WildMenu        guifg='.s:black         .' guibg='.s:lightyellow    .' gui='.s:none
exe 'hi PmenuSbar       guifg='.s:black         .' guibg='.s:lightwhite     .' gui='.s:none
exe 'hi Ignore          guifg='.s:none          .' guibg='.s:none           .' gui='.s:none

exe 'hi Error           guifg='.s:lightwhite    .' guibg='.s:darkred        .' gui='.s:none
exe 'hi ErrorMsg        guifg='.s:lightwhite    .' guibg='.s:darkred        .' gui='.s:none
exe 'hi WarningMsg      guifg='.s:lightwhite    .' guibg='.s:darkorange     .' gui='.s:none

" Message displayed in lower left, such as --INSERT--
exe 'hi ModeMsg         guifg='.s:black         .' guibg='.s:lightred       .' gui='.s:bold

exe 'hi CursorLine      guifg='.s:none          .' guibg='.s:darkgray       .' gui='.s:none
exe 'hi CursorColumn    guifg='.s:none          .' guibg='.s:none           .' gui='.s:bold
exe 'hi MatchParen      guifg='.s:lightwhite    .' guibg='.s:lightgray      .' gui='.s:none

" Omnicompletion (<c-n> and <c-p>)
exe 'hi Pmenu           guifg='.s:black         .' guibg='.s:white          .' gui='.s:none
exe 'hi PmenuSel        guifg='.s:black         .' guibg='.s:magenta        .' gui='.s:none

exe 'hi Search          guifg='.s:none          .' guibg='.s:magenta        .' gui='.s:bold    .' ctermfg='.s:none .' ctermbg='.s:none

" Syntax highlighting
exe 'hi Comment         guifg='.s:lightgray     .' guibg='.s:none           .' gui='.s:none
exe 'hi String          guifg='.s:lightgreen    .' guibg='.s:none           .' gui='.s:none
exe 'hi Number          guifg='.s:lightmagenta  .' guibg='.s:none           .' gui='.s:none

exe 'hi Keyword         guifg='.s:lightblue     .' guibg='.s:none           .' gui='.s:none
exe 'hi Operator        guifg='.s:lightblue     .' guibg='.s:none           .' gui='.s:none
exe 'hi PreProc         guifg='.s:lightblue     .' guibg='.s:none           .' gui='.s:none
exe 'hi Conditional     guifg='.s:lightblue     .' guibg='.s:none           .' gui='.s:none

exe 'hi Todo            guifg='.s:lightred      .' guibg='.s:none           .' gui='.s:none
exe 'hi Constant        guifg='.s:lightcyan     .' guibg='.s:none           .' gui='.s:bold
exe 'hi Boolean         guifg='.s:lightcyan     .' guibg='.s:none           .' gui='.s:none

exe 'hi Identifier      guifg='.s:lightblue     .' guibg='.s:none           .' gui='.s:none
exe 'hi Function        guifg='.s:yellow        .' guibg='.s:none           .' gui='.s:none
exe 'hi Type            guifg='.s:lightyellow   .' guibg='.s:none           .' gui='.s:none
exe 'hi Statement       guifg='.s:lightblue     .' guibg='.s:none           .' gui='.s:none

exe 'hi Special         guifg='.s:lightwhite    .' guibg='.s:none           .' gui='.s:none
exe 'hi Delimiter       guifg='.s:lightercyan   .' guibg='.s:none           .' gui='.s:none

" The spelling highlights are used for errors (e.g. vim-ale uses it).
exe 'hi SpellBad        guifg='.s:none          .' guibg='.s:darkred        .' gui='.s:none
exe 'hi SpellCap        guifg='.s:none          .' guibg='.s:darkorange     .' gui='.s:none

" Floating hovering window
exe 'hi NormalFloat     guifg='.s:none          .' guibg='.s:none           .' gui='.s:none


hi link Character       Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special
