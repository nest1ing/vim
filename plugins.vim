" Install vim-plug if not exists
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!~/.vim/install-plug-vim.sh vim'
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'jszakmeister/vim-togglecursor'

Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/DoxygenToolkit.vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" IDE specific plugins
Plug 'vim-scripts/FSwitch'
Plug 'vim-scripts/ProtoDef', { 'do': '!chmod 0755 ~/.vim/plugged/ProtoDef/pullproto.pl' }
Plug 'vim-scripts/Tagbar'

Plug 'ervandew/supertab'
" if (has('nvim'))
"     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"     Plug 'Shougo/deoplete.nvim'
"     Plug 'roxma/nvim-yarp'
"     Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'zchee/deoplete-clang'
" Plug 'Shougo/neoinclude.vim'

function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
        !./install.py --clang-completer
    endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'rdnetto/YCM-Generator',  { 'branch': 'stable' }

" Initialize plugin system
call plug#end()

" Enable Indent in plugins
filetype plugin indent on
" Enable syntax highlighting
syntax on

" -------
" Unite

let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
let g:unite_source_file_mru_limit = 100
let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_limit = 40
let g:unite_source_grep_default_opts = '-iRHns'
let g:unite_source_rec_max_cache_files = 99999

" --------
" NERD-Tree

let NERDTreeWinSize = 30
let NERDTreeChDirMode=2             "setting root dir in NT also sets VIM's cd
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = 'right'
let NERDTreeIgnore=['\.o','\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeQuitOnOpen=1            "the Nerdtree window will be close after a file is opend.
let NERDTreeKeepTreeInNewTab=1

" open NERDTree automatically when vim starts up if no files where specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left open is a NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" --------
" Tagbar
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1

" --------
" FSwitch
augroup fswitch
    au!
    au BufEnter *.cpp,*.cxx,*.cc,*.c,*.inl  let b:fswitchdst  = 'h,hpp'
    au BufEnter *.cpp,*.cxx,*.cc,*.c,*.inl  let b:fswitchlocs = 'reg:|src|include|,reg:|src|inc|'
    au BufEnter *.h,*.hpp                   let b:fswitchdst  = 'cpp,c,inl,cxx,cc'
    au BufEnter *.h,*.hpp                   let b:fswitchlocs = 'reg:|include|src|,reg:|inc|src|'
    au BufEnter *.h,*.hpp,*.cpp,*.cxx,*.cc,*.c,*.inl nmap <silent> <leader>of :FSHere<cr>
augroup END

" --------
" ProtoDef
let g:protodefprotogetter=$HOME."/.vim/bundle/ProtoDef/pullproto.pl"

" --------
" SuperTab
"let g:SuperTabDefaultCompletionType = '<c-n>'

" --------
" YouCompleteMe
let g:ycm_global_ycm_extra_conf=$HOME."/.vim/ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_filetype_blacklist={
        \ 'tagbar' : 1,
        \ 'qf' : 1,
        \ 'notes' : 1,
        \ 'unite' : 1,
        \ 'vimwiki' : 1,
        \ 'mail' : 1
        \}
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" --------
" UltiSnip
" let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" --------
" DoxygenToolkit

" --------
" Deoplete.nvim
let g:deoplete#enable_at_startup=1
let g:deoplete#sources#clang#libclang_path='/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib64/clang'
