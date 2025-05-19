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
let s:italic = "ITALIC"
let s:underline = "underline"
let s:boldunderline = "BOLD,underline"

" Additional colors.
let s:darkgray = "#202020"
let s:darkred = "#770000"
let s:darkorange = "#773c00"
let s:lightblack = "#474747"
let s:darkpurple = "#382338"

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "grb24bit"


" General colors. Forgive me for the way that all of this is formatted.
exe 'hi Directory       guifg='.s:lightcyan     .' guibg='.s:black          .' gui='.s:bold
exe 'hi Normal          guifg='.s:white         .' guibg='.s:black          .' gui='.s:none
exe 'hi NonText         guifg='.s:lightblack    .' guibg='.s:none           .' gui='.s:none

exe 'hi Cursor          guifg='.s:black         .' guibg='.s:lightwhite     .' gui='.s:reverse
exe 'hi CursorInsert    guifg='.s:black         .' guibg='.s:lightgreen     .' gui='.s:reverse

exe 'hi LineNr          guifg='.s:lightgray     .' guibg='.s:none           .' gui='.s:none

exe 'hi VertSplit       guifg='.s:lightgray     .' guibg='.s:lightgray      .' gui='.s:none
exe 'hi StatusLine      guifg='.s:black         .' guibg='.s:white          .' gui='.s:none
exe 'hi StatusLineNC    guifg='.s:black         .' guibg='.s:lightgray      .' gui='.s:none  

exe 'hi Folded          guifg='.s:none          .' guibg='.s:none           .' gui='.s:none
exe 'hi Title           guifg='.s:none          .' guibg='.s:none           .' gui='.s:none
exe 'hi Visual          guifg='.s:none          .' guibg='.s:gray           .' cterm='.s:reverse

exe 'hi WildMenu        guifg='.s:black         .' guibg='.s:lightyellow    .' gui='.s:none
exe 'hi PmenuSbar       guifg='.s:black         .' guibg='.s:lightwhite     .' gui='.s:none
exe 'hi Ignore          guifg='.s:none          .' guibg='.s:none           .' gui='.s:none

exe 'hi Error           guifg='.s:lightwhite    .' guibg='.s:darkred        .' gui='.s:none
exe 'hi ErrorMsg        guifg='.s:lightwhite    .' guibg='.s:darkred        .' gui='.s:none
exe 'hi WarningMsg      guifg='.s:lightwhite    .' guibg='.s:darkorange     .' gui='.s:none

" Message displayed in lower left, such as --INSERT--
exe 'hi ModeMsg         guifg='.s:black         .' guibg='.s:lightred       .' gui='.s:bold
exe 'hi WarningMsg      guifg='.s:magenta  .' guibg='.s:black       .' gui='.s:bold
exe 'hi ErrorMsg      guifg='.s:red  .' guibg='.s:black       .' gui='.s:bold
exe 'hi MoreMsg      guifg='.s:lightred  .' guibg='.s:black       .' gui='.s:bold
exe 'hi Question        guifg='.s:lightmagenta  .' guibg='.s:black     .' gui='.s:bold

exe 'hi CursorLine      guifg='.s:none          .' guibg='.s:darkgray       .' gui='.s:none
exe 'hi CursorColumn    guifg='.s:none          .' guibg='.s:none           .' gui='.s:bold
exe 'hi MatchParen      guifg='.s:lightwhite    .' guibg='.s:lightgray      .' gui='.s:none

" Omnicompletion (<c-n> and <c-p>)
" exe 'hi Pmenu           guifg='.s:black         .' guibg='.s:white          .' gui='.s:none
" exe 'hi PmenuSel        guifg='.s:black         .' guibg='.s:magenta        .' gui='.s:none
exe 'hi Pmenu           guifg='.s:white         .' guibg='.s:darkpurple     .' gui='.s:none
exe 'hi PmenuSel        guifg='.s:black         .' guibg='.s:lightmagenta   .' gui='.s:bold
exe 'hi PmenuSbar       guibg='.s:gray
exe 'hi PmenuThumb      guibg='.s:lightgray

exe 'hi Search          guifg='.s:black         .' guibg='.s:lightmagenta   .' gui='.s:none
exe 'hi IncSearch       guifg='.s:black         .' guibg='.s:magenta        .' gui='.s:none
exe 'hi CurSearch       guifg='.s:black         .' guibg='.s:magenta        .' gui='.s:boldunderline

exe 'hi Substitute      guifg='.s:black         .' guibg='.s:lightcyan      .' gui='.s:boldunderline

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
exe 'hi  netrwSymLink   guifg='.s:lightred    .' guibg='.s:none           .' gui='.s:none
exe 'hi Delimiter       guifg='.s:lightercyan   .' guibg='.s:none           .' gui='.s:none
exe 'hi SpecialKey      guifg='.s:yellow        .' guibg='.s:none           .' gui='.s:none

" The spelling highlights are used for errors (e.g. vim-ale uses it).
exe 'hi SpellBad        guifg='.s:none          .' guibg='.s:none        .' gui='.s:none
" erroneously highlights underscore in doc from pmenu in darkred
exe 'hi SpellCap        guifg='.s:none          .' guibg='.s:darkorange     .' gui='.s:none

" Floating windows (e.g., LSP popups)
exe 'hi NormalFloat     guifg='.s:white         .' guibg='.s:darkgray     .' gui='.s:none
exe 'hi FloatBorder     guifg='.s:lightgray     .' guibg='.s:darkpurple     .' gui='.s:none
exe 'hi LspInfoBorder   guifg='.s:lightgray     .' guibg='.s:darkpurple     .' gui='.s:none
exe 'hi WinSeparator    guifg='.s:gray          .' guibg='.s:darkpurple     .' gui='.s:none

" Virtual text (in-line LSP messages)
exe 'hi DiagnosticVirtualTextError guifg='.s:lightred    .' guibg='.s:darkpurple .' gui='.s:bold
exe 'hi DiagnosticVirtualTextWarn  guifg='.s:yellow      .' guibg='.s:darkgray .' gui='.s:bold
exe 'hi DiagnosticVirtualTextInfo  guifg='.s:lightblue   .' guibg='.s:black .' gui='.s:none
exe 'hi DiagnosticVirtualTextHint  guifg='.s:lightgray   .' guibg='.s:black .' gui='.s:none

exe 'hi DiagnosticUnderlineError   guisp='.s:lightred
exe 'hi DiagnosticUnderlineWarn    guisp='.s:yellow
exe 'hi DiagnosticUnderlineInfo    guisp='.s:lightblue
exe 'hi DiagnosticUnderlineHint    guisp='.s:lightgray

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

" Treesitter highlights
hi link @variable        Identifier
hi link @parameter       Identifier
hi link @function        Function
hi link @function.call   Function
hi link @type            Type
hi link @type.builtin    Type
hi link @keyword         Keyword
hi link @string          String
hi link @number          Number
hi link @boolean         Boolean
hi link @operator        Operator

" Markdown with TreeSitter
exe 'hi @markup.raw         guifg='.s:lightercyan     .' guibg='.s:none       .' gui='.s:none
exe 'hi @markup.heading.1   guifg='.s:lightred        .' guibg='.s:none       .' gui='.s:bold
exe 'hi @markup.heading.2   guifg='.s:lightmagenta    .' guibg='.s:none       .' gui='.s:bold
exe 'hi @markup.heading.3   guifg='.s:lightcyan       .' guibg='.s:none       .' gui='.s:bold
exe 'hi @markup.heading.3   guifg='.s:lightgreen      .' guibg='.s:none       .' gui='.s:bold
exe 'hi @markup.list        guifg='.s:lightgray       .' guibg='.s:none       .' gui='.s:bold
exe 'hi @markup.strong      guifg='.s:lightyellow     .' guibg='.s:none       .' gui='.s:bold
exe 'hi @markup.italic      guifg='.s:lightyellow     .' guibg='.s:none       .' gui='.s:italic

" Abbreviation match (bold)
exe 'hi! CmpItemAbbrMatch        guifg='.s:lightcyan    .' gui='.s:bold
exe 'hi! CmpItemAbbrMatchFuzzy   guifg='.s:lightcyan    .' gui='.s:bold

" Functions and methods
exe 'hi! CmpItemKindFunction     guifg='.s:lightblue
exe 'hi! CmpItemKindMethod       guifg='.s:lightblue

" Variables and fields
exe 'hi! CmpItemKindVariable     guifg='.s:lightmagenta
exe 'hi! CmpItemKindField        guifg='.s:lightmagenta

" Classes and interfaces
exe 'hi! CmpItemKindClass        guifg='.s:lightyellow
exe 'hi! CmpItemKindInterface    guifg='.s:lightyellow

" Properties
exe 'hi! CmpItemKindProperty     guifg='.s:lightgreen

" Modules and namespaces
exe 'hi! CmpItemKindModule       guifg='.s:magenta

" Keywords and constants
exe 'hi! CmpItemKindKeyword      guifg='.s:lightcyan
exe 'hi! CmpItemKindConstant     guifg='.s:lightcyan

" Constructors and enums
exe 'hi! CmpItemKindConstructor  guifg='.s:lightred
exe 'hi! CmpItemKindEnum         guifg='.s:lightred

" Snippets
exe 'hi! CmpItemKindSnippet      guifg='.s:green

" Text, files, folders
exe 'hi! CmpItemKindText         guifg='.s:white
exe 'hi! CmpItemKindFile         guifg='.s:lightgray
exe 'hi! CmpItemKindFolder       guifg='.s:gray

" Gitsigns
exe 'hi! GitSignsAdd              guifg='.s:lightgreen    .' guibg='.s:none .' gui='.s:none
exe 'hi! GitSignsChange           guifg='.s:lightmagenta  .' guibg='.s:none .' gui='.s:none
exe 'hi! GitSignsDelete           guifg='.s:red           .' guibg='.s:none .' gui='.s:none
exe 'hi! GitSignsCurrentLineBlame guifg='.s:lightgray     .' guibg='.s:none .' gui='.s:italic

" Diff sections (used broadly in Neogit)
exe 'hi! DiffAdd      guifg='.s:none       .' guibg=#1b2a1b gui='.s:none
exe 'hi! DiffDelete   guifg='.s:none       .' guibg=#3a1f1f gui='.s:none
exe 'hi! DiffChange   guifg='.s:none       .' guibg=#2a2a1f gui='.s:none
exe 'hi! DiffText     guifg='.s:white      .' guibg=#445544 gui='.s:bold

" Neogit-specific groups
" NeogitBranch — like a header or tag; should be vivid
exe 'hi! NeogitBranch               guifg='.s:lightgreen     .' guibg='.s:none .' gui='.s:bold

" NeogitDiffAddHighlight — added lines, should match DiffAdd bg
exe 'hi! NeogitDiffAddHighlight    guifg='.s:none           .' guibg=#1b2a1b gui='.s:none

" NeogitDiffContextHighlight — neutral context lines, subtle contrast
exe 'hi! NeogitDiffContextHighlight guifg='.s:lightgray     .' guibg=#202020 gui='.s:none

" NeogitDiffDeleteHighlight — removed lines, should match DiffDelete bg
exe 'hi! NeogitDiffDeleteHighlight guifg='.s:none           .' guibg=#3a1f1f gui='.s:none

" NeogitHunkHeader — non-highlighted, so styled like Pmenu
exe 'hi! NeogitHunkHeader          guifg='.s:white          .' guibg='.s:darkpurple .' gui='.s:none

" NeogitHunkHeaderHighlight — vivid version of above, active hunk
exe 'hi! NeogitHunkHeaderHighlight guifg='.s:black          .' guibg='.s:lightcyan .' gui='.s:bold

" NeogitRemote — generally italicized and distinctive
exe 'hi! NeogitRemote              guifg='.s:lightmagenta   .' guibg='.s:none .' gui='.s:italic

