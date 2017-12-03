" Vim color file
" Maintainer:		nest1ing <shurik.f@gmail.com>
" Last Change:		2017-12-02
"
" cool help screens
"  :he group-name
"  :he highlight-groups
"  :he cterm-colors
"
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="soldarkrbg"
"------------------------------------------------------------------------------
" Group			guifg, guibg, gui				ctermfg, ctermbg, cterm
"------------------------------------------------------------------------------
if has("gui_running") || has("termguicolors")
    "  == highlight groups ==
    hi! Normal          guifg=#839496 guibg=#002b36 gui=NONE
    hi! LineNr          guifg=#586e75 guibg=#073642 gui=NONE
    hi! NonText         guifg=#3465A4 guibg=#073642 gui=bold
    hi! SignColumn      guifg=NONE    guibg=#002b36 gui=NONE
    hi! FoldColumn      guifg=#839496 guibg=#073642 gui=NONE
    hi! Folded          guifg=#839496 guibg=#073642 gui=underline,bold  guisp=#002b36
    hi! VertSplit       guifg=#657b83 guibg=#657b83 gui=NONE
    hi! StatusLine	    guifg=#002b36 guibg=#93a1a1 gui=NONE            cterm=NONE
    hi! StatusLineNC    guifg=#073642 guibg=#657b83 gui=NONE            cterm=NONE
    hi! ModeMsg		    guifg=#FFFFD8
    hi! MoreMsg		    guifg=#FFFFD8
    hi! Cursor          guifg=#002b36 guibg=#839496 gui=NONE
    hi! CursorLine      guifg=NONE    guibg=#073642 gui=NONE            guisp=#93a1a1 cterm=NONE
    hi! CursorColumn    guifg=NONE    guibg=#073642 gui=NONE
    hi! ColorColumn     guifg=NONE    guibg=#073642 gui=NONE
    hi! Visual          guifg=NONE    guibg=#37474D gui=NONE
    hi! VisualNOS       guifg=NONE    guibg=#37474D gui=NONE

    hi! Directory       guifg=#268bd2 guibg=NONE    gui=NONE
    hi! ErrorMsg        guifg=#dc322f guibg=NONE    gui=reverse
    hi! IncSearch       guifg=#cd4b16 guibg=NONE    gui=standout
    hi! Search          guifg=#b58900 guibg=NONE    gui=reverse
    hi! Question        guifg=#2aa198 guibg=NONE    gui=bold
    hi! Title           guifg=#cd4b16 guibg=NONE    gui=bold
    hi! WarningMsg      guifg=#dc322f guibg=NONE    gui=bold
    hi! WildMenu        guifg=#eee8d5 guibg=#073642 gui=NONE
    hi! DiffAdd         guifg=#719e07 guibg=#073642 gui=bold            guisp=#719e07
    hi! DiffChange      guifg=#b58900 guibg=#073642 gui=bold            guisp=#b58900
    hi! DiffDelete      guifg=#dc322f guibg=#073642 gui=bold
    hi! DiffText        guifg=#268bd2 guibg=#073642 gui=bold            guisp=#268bd2
    hi! Conceal         guifg=#268bd2 guibg=NONE    gui=NONE
    hi! SpellBad        guifg=NONE    guibg=NONE    gui=undercurl       guisp=#dc322f
    hi! SpellCap        guifg=NONE    guibg=NONE    gui=undercurl       guisp=#6c71c4
    hi! SpellRare       guifg=NONE    guibg=NONE    gui=undercurl       guisp=#2aa198
    hi! SpellLocal      guifg=NONE    guibg=NONE    gui=undercurl       guisp=#b58900
    hi! Pmenu           guifg=#839496 guibg=#073642 gui=NONE
    hi! PmenuSel        guifg=#586e75 guibg=#eee8d5 gui=NONE
    hi! PmenuSbar       guifg=#eee8d5 guibg=#839496 gui=NONE
    hi! PmenuThumb      guifg=#839496 guibg=#002b36 gui=NONE
    hi! TabLine         guifg=#839496 guibg=#073642 gui=underline       guisp=#839496
    hi! TabLineFill     guifg=#839496 guibg=#073642 gui=underline       guisp=#839496
    hi! TabLineSel      guifg=#586e75 guibg=#eee8d5 gui=underline       guisp=#839496
    hi! MatchParen      guifg=#b58900 guibg=#586e75 gui=bold


    " == syntax groups ==
    hi! Comment         guifg=#268bd2
    hi! Constant        guifg=#DCADB6
    hi! Identifier      guifg=#2aa198
    hi! Statement       guifg=#b58900
    hi! PreProc         guifg=#6c71c4
    hi! Type            guifg=#00AD00
    hi! Special         guifg=#9383D8
    hi! Underlined      guifg=#2aa198               gui=underline cterm=underline
    hi! Error           guifg=#fdf6e3 guibg=#dc322f
    hi! Todo            guifg=#267bd2 guibg=#FFEB8B

endif

