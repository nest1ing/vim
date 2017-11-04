" Turn off filetype plugins before bundles init
filetype off

" Auto installing NeoBundle
let isNpmInstalled = executable("npm")
let iCanHazNeoBundle = 1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    if !isNpmInstalled
        echo "==============================================="
        echo "Your need to install npm to enable all features"
        echo "==============================================="
    endif
    echo "Installing NeoBundel..."
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazHeoBundle=0
endif

" Call NeoBundle
if has('vim_starting')
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand($HOME.'/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'

" Install vimproc. Is used by unite and neocomplcache for async searches and calls
NeoBundle 'Shougo/vimproc.vim', {
      \   'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \   }
      \ }

" Plugin for fuzzy file search, most recent files list and much more
NeoBundle 'Shougo/unite.vim'

" Most recent files source for unite
NeoBundle 'Shougo/neomru.vim'

" Plugin for changing cursor when entering in insert mode
" looks like it works fine with iTerm Konsole adn xerm
" Applies only on next vim launch after NeoBundleInstall
NeoBundle 'jszakmeister/vim-togglecursor'

NeoBundle 'scrooloose/nerdtree'

" IDE specific plugins
NeoBundle 'vim-scripts/FSwitch'
NeoBundle 'vim-scripts/ProtoDef'
NeoBundle 'vim-scripts/Tagbar'

NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'rdnetto/YCM-Generator'

call neobundle#end()

" Installing bundles for the first time
if iCanHazNeoBundle == 0
	echo 'Installing Bundles, please ignore key map error messages'
	:NeoBundleInstall
	:so $MYVIMRC
endif

" Enable Indent in plugins
filetype plugin indent on
" Enable syntax highlighting
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

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

" let NERDChristmasTree = 0
let NERDTreeWinSize = 30
let NERDTreeChDirMode=2             "setting root dir in NT also sets VIM's cd
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = 'right'
let NERDTreeIgnore=['\.o','\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeQuitOnOpen=1            "the Nerdtree window will be close after a file is opend.
"let NERDTreeShowHidden=0
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
" YouCompleteMe
let g:ycm_global_ycm_extra_conf=$HOME."/.vim/ycm_extra_conf.py"
"let g:ycm_extra_conf_globlist=['~/.vim/*']
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

noremap <silent> <leader>yc     :YcmCompleter GetDoc<CR>
noremap <silent> <leader>yf     :YcmCompleter FixIt<CR>
noremap <silent> <leader>yg     :YcmCompleter GoTo<CR>
noremap <silent> <leader>yi     :YcmCompleter GoToInclude<CR>
noremap <silent> <leader>yt     :YcmCompleter GetType<CR>
noremap <silent> <leader>jd     :YcmCompleter GoToDefinitionElseDeclaration<CR>

