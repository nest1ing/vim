" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
let s:plug_vim_path = '~/.vim/autoload/plug.vim'
let s:plugged_path = '~/.vim/plugged'

" For Neovim: ~/.local/share/nvim/plugged
if has('nvim')
    let s:plug_vim_path = '~/.local/share/nvim/site/autoload/plug.vim'
    let s:plugged_path = '~/.local/share/nvim/plugged'
endif

" Install vim-plug if not exists
if empty(glob(s:plug_vim_path))
    execute 'silent !curl -fLo  ' . s:plug_vim_path . ' --create-dirs ' .
        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(s:plugged_path)
" Make sure you use single quotes

" misc plugins
if has('nvim')
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neomru.vim'
else
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/neomru.vim'
    Plug 'jszakmeister/vim-togglecursor'
endif

" additional filetype plugins
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'kergoth/vim-bitbake'
Plug 'sedan07/vim-mib'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'mfukar/robotframework-vim'

" integrate with git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" IDE specific plugins
Plug 'derekwyatt/vim-fswitch'
Plug 'derekwyatt/vim-protodef'
Plug 'majutsushi/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'rhysd/vim-clang-format'
Plug 'ludovicchabant/vim-gutentags'

" Autocompletion
Plug 'ervandew/supertab'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'deoplete-plugins/deoplete-clang'
Plug 'Shougo/neoinclude.vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'sebastianmarkow/deoplete-rust'

" Initialize plugin system
call plug#end()

" Enable Indent in plugins
filetype plugin indent on
" Enable syntax highlighting
syntax on

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
    au BufEnter *.cpp,*.cxx,*.cc,*.c,*.inl  let b:fswitchdst  = 'hpp,h'
    au BufEnter *.cpp,*.cxx,*.cc,*.c,*.inl  let b:fswitchlocs = 'reg:|src|include|,reg:|src|inc|'
    au BufEnter *.h,*.hpp                   let b:fswitchdst  = 'cpp,c,inl,cxx,cc'
    au BufEnter *.h,*.hpp                   let b:fswitchlocs = 'reg:|include|src|,reg:|inc|src|'
    au BufEnter *.h,*.hpp,*.cpp,*.cxx,*.cc,*.c,*.inl nmap <silent> <leader>of :FSHere<cr>
augroup END

" --------
" SuperTab
let g:SuperTabClosePreviewOnPopupClose = 1

" --------
" DoxygenToolkit
let g:DoxygenToolkit_licenseTag = "\<enter>"
let g:DoxygenToolkit_licenseTag .= "SPDX-License-Identifier: Apache-2.0\<enter>"
let g:DoxygenToolkit_licenseTag .= "Copyright (C) ".strftime("%Y")." YADRO."
let g:DoxygenToolkit_authorName = 'nest1ing <shurik.f@gmail.com>'

" --------
" Deoplete.nvim
let g:deoplete#enable_at_startup=1
let g:deoplete#sources#clang#std={'c': 'c11', 'cpp': 'c++17'}

" Auto close preview
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" --------
" vim-syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "▶"
let g:syntastic_warning_symbol = "▶"
let g:syntastic_style_error_symbol = "▶"
let g:syntastic_style_warning_symbol = "▶"
let g:syntastic_python_checkers = [ "flake8" ]
let g:syntastic_cpp_compiler_options = "-std=c++17"
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_include_dirs = ['build', 'src', 'test']

" ---------
" vim-clang-format
"let g:clang_format#code_style = "llvm"
"let g:clang_format#auto_format = 1
"let g:clang_format#auto_format_on_insert_leave = 1
augroup ClangFormatSettings
    autocmd!
    " map to <Leader>cf in C++ code
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
augroup END

" --------
" deoplete-rust
let g:deoplete#sources#rust#racer_binary=$HOME.'/.cargo/bin/racer'
"let g:deoplete#sources#rust#rust_source_path='/usr/lib/rustlib/src/rust/src'
let g:deoplete#sources#rust#rust_source_path=$HOME.'/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:deoplete#sources#rust#show_duplicates=1

" --------
" vim-gutentags
let g:gutentags_modules=['gtags_cscope']

" --------
" vim-gitgutter
let g:gitgutter_override_sign_column_highlight = 0
