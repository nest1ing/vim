" Vim color file
" Maintainer:		nest1ing <shurik.f@gmail.com>
" Last Change:		2012-01-25
"
" cool help screens
"  :he group-name
"  :he highlight-groups
"  :he cterm-colors
"  :so $VIMRUNTIME/syntax/hitest.vim
"  :so $VIMRUNTIME/syntax/colortest.vim
"  :so $VIMRUNTIME/colors/tools/check_colors.vim
"
set background=dark

hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="mydefault"
"------------------------------------------------------------------------------
" Group			guifg, guibg, gui				ctermfg, ctermbg, cterm
"------------------------------------------------------------------------------
if has("gui_running") || &t_Co > 255
    "  == highlight groups ==
    hi Normal		    guifg=#B2BEC2   guibg=#141C1E
    hi LineNr		    guifg=#596e76   guibg=#080B0C
    hi NonText		    guifg=#3465A4   guibg=#080B0C
    hi SignColumn                       guibg=#080B0C
    hi FoldColumn	    guifg=#3465A4   guibg=#080B0C
    hi Folded		    guifg=#D3D7CF   guibg=#204A87
    hi VertSplit	    guifg=#4E6169   guibg=#4E6169   gui=bold
    hi StatusLine	    guifg=#8CA6AF   guibg=#090C0D
    hi StatusLineNC	    guifg=#4E6169   guibg=#E0EDF1
    hi ModeMsg		    guifg=#FFFFD8
    hi MoreMsg		    guifg=#FFFFD8
    hi Cursor           guifg=#000000   guibg=#008900
    hi CursorLine                       guibg=#212A2E
    hi Visual                           guibg=#37474D
    hi VisualNOS                        guibg=#37474d   gui=none
    hi! link ColorColumn CursorLine

    hi Pmenu		    guifg=#B2BEC2   guibg=#1D2529
    hi PmenuSel		    guifg=#B2BEC2   guibg=#283338
    hi PmenuSbar	    guibg=#4E6169
    hi PmenuThumb	    guifg=#8CA6AF

    hi! link TabLine Pmenu
    hi! link TabLineSel PmenuSel
    hi! link TabLineFill Pmenu

    " == syntax groups ==
    hi Comment          guifg=#0083B6
    hi Constant         guifg=#DCADB6
    hi Identifier       guifg=#00EBF0
    hi Statement        guifg=#BA8300
    hi PreProc          guifg=#9383B6
    hi Type             guifg=#00AD00
    hi Special          guifg=#9383D8

    hi Underlined       guifg=#6AEBFF
    hi Error            guibg=#D7E7EC   guifg=#BA0000     gui=reverse
    hi Todo             guibg=#0000F0   guifg=#FFEB8B     gui=reverse

    hi DiffAdd                          guibg=#003100
    hi DiffDelete       guifg=#3465A4   guibg=#080B0C
    hi DiffChange                       guibg=#2C2842
    hi DiffText                         guibg=#4B3B59
endif

