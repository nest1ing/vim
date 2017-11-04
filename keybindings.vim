" Copy selected block to clipboard
vmap <C-Insert>	"+Y

" < & > moved block in visual mode
vmap < <gv
vmap > >gv

" Do not switch to REPLACE mode
imap <ins> <esc>a

" Smart <Home>
nmap <Home> ^
imap <Home> <Esc>I

" Wild menu
set wildmenu
set wcm=<Tab>

" <F1> showing help for work under cursor
imap <F1> <Esc> :exe "Man ".expand("<cword>")<cr>
nmap <F1>       :exe "Man ".expand("<cword>")<cr>

" Define group of commands.
" Commands defined in .vimrc don't bind twice if .vimrc will reload
augroup helppages
    " Delete any previously defined autocommands
    au!

    " Show help for work under cursor by press <F1>
    autocmd FileType vim :nmap <buffer> <F1>        :exe "help ".expand("<cword>")<cr>
    autocmd FileType vim :imap <buffer> <F1> <Esc>  :exe "help ".expand("<cword>")<cr>

    " Close help page by press <q>
    autocmd FileType man  :nmap <buffer> q :call QuitHelp()<cr>
    autocmd FileType info :nmap <buffer> q :call QuitHelp()<cr>
    autocmd FileType help :nmap <buffer> q :call QuitHelp()<cr>
    autocmd FileType qf   :nmap <buffer> q :call QuitHelp()<cr>
" Group end
augroup END

"<S-F1> - toggle line numbers
map  <S-F1>      :set nu!<cr>
imap <S-F1> <Esc>:set nu!<cr>a

" <F8> - check spelling
menu VVspell.enable_ru      :setlocal spell spelllang=ru<CR>
menu VVspell.enable_en      :setlocal spell spelllang=en<CR>
menu VVspell.enable_enru    :setlocal spell spelllang=en,ru<CR>
menu VVspell.disable        :setlocal spell spelllang=<CR>
map <F8>                    :emenu VVspell.<Tab>

" <S-F8> change file encoding
menu Encoding.utf-8         :e ++enc=utf-8<CR>
menu Encoding.cp1251        :e ++enc=cp1251<CR>
menu Encoding.cp88          :e ++enc=ibm866<CR>
menu Encoding.koi8-r        :e ++enc=koi8-r<CR>
map <S-F8>                  :emenu Encoding.<Tab>

" <C-F8> change file format
menu EOL.unix               :set fileformat=unix<CR>
menu EOL.dos                :set fileformat=dos<CR>
menu EOL.mac                :set fileformat=mac<CR>
map <C-F8>                  :emenu EOL.<Tab>

" <F11> toggle Tagbar
map  <F11>                  :TagbarToggle<CR>
vmap <F11>             <Esc>:TagbarToggle<CR>
imap <F11>             <Esc>:TagbarToggle<CR>

" <S-F11> toggle NERDTree
map  <S-F11>                :NERDTreeToggle<CR>
vmap <S-F11>           <Esc>:NERDTreeToggle<CR>
imap <S-F11>           <Esc>:NERDTreeToggle<CR>


" <S-F12> update ctags
noremap <S-F12>             :call UpdateCtags()<CR>

" Hotkey for open window with most recent files
nnoremap <silent><leader>m  :Unite file_mru<CR>
" Unite-grep
nnoremap <silent><leader>/  :Unite grep:. -no-start-insert -no-quit -keep-focus -wrap<CR>


" -----------------------------------------------------------------------
" Helper functions

function! QuitHelp()
    bd
    if bufname("%")==""
        q
    endif
endfunction

function! UpdateCtags()
    !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
    echo "Create ctags OK"
endfunction
