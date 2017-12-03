" Vim color file
" Maintainer:		nest1ing <shurik.f@gmail.com>
" Last Change:		2012-01-25
"
" cool help screens
"  :he group-name
"  :he highlight-groups
"  :he cterm-colors
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
    hi! Normal		    guifg=#B2BEC2 guibg=#141C1E ctermfg=246 ctermbg=233
    hi! LineNr		    guifg=#596e76 guibg=#000000 ctermfg=239 ctermbg=0
    hi! NonText		    guifg=#3465A4 guibg=#000000 ctermfg=24  ctermbg=0 cterm=bold
    hi! SignColumn                    guibg=#000000             ctermbg=0
    hi! FoldColumn	    guifg=#3465A4 guibg=#000000 ctermfg=24  ctermbg=0
    hi! Folded		    guifg=#D3D7CF guibg=#204A87 ctermfg=67  ctermbg=16
    hi! VertSplit	    guifg=#4E6169 guibg=#4E6169 ctermfg=244 ctermbg=232 cterm=bold gui=bold
    hi! StatusLine	    guifg=#8CA6AF guibg=#090C0D ctermfg=244 ctermbg=232
    hi! StatusLineNC	guifg=#4E6169 guibg=#E0EDF1 ctermfg=238 ctermbg=253
    hi! ModeMsg		    guifg=#FFFFD8               ctermfg=229
    hi! MoreMsg		    guifg=#FFFFD8               ctermfg=229
    hi! Cursor          guifg=#000000 guibg=#008900
    hi! CursorLine                    guibg=#212A2E             ctermbg=234 cterm=none
    hi! Visual                        guibg=#37474D             ctermbg=236
    hi! VisualNOS                     guibg=#37474d             ctermbg=236 cterm=none gui=none
    hi! ColorColumn                   guibg=#000000             ctermbg=234

    hi! Pmenu		    guifg=#eeeeec guibg=#2e3436 ctermfg=81  ctermbg=16
    hi! PmenuSel		guifg=#1e2426 guibg=#ffffff             ctermbg=244
    hi! PmenuSbar	    guibg=#555753                           ctermbg=232
    hi! PmenuThumb	    guifg=#ffffff               ctermfg=81

    " == syntax groups ==
    hi! Comment          guifg=#0083B6               ctermfg=24
    hi! Constant         guifg=#DCADB6               ctermfg=174
    hi! Identifier       guifg=#00EBF0               ctermfg=44
    hi! Statement        guifg=#BA8300               ctermfg=130
    hi! PreProc          guifg=#9383B6               ctermfg=96
    hi! Type             guifg=#00AD00               ctermfg=28
    hi! Special          guifg=#9383D8               ctermfg=97

    hi! Underlined       guifg=#6AEBFF                                       cterm=underline
    hi! Error            guifg=#D7E7EC guibg=#BA0000 ctermfg=252 ctermbg=124
    hi! Todo             guifg=#0000F0 guibg=#FFEB8B ctermfg=20  ctermbg=221
endif

