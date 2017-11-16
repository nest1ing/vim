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

runtime ftplugin/man.vim
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

" C/C++ helpers
nnoremap <silent><leader>hg :call CreateCHeaderGuard()<CR>
nnoremap <silent><leader>cc :call CenterCComment()<CR>

if exists( "g:loaded_youcompleteme" )
    noremap <silent> <leader>yc     :YcmCompleter GetDoc<CR>
    noremap <silent> <leader>yf     :YcmCompleter FixIt<CR>
    noremap <silent> <leader>yg     :YcmCompleter GoTo<CR>
    noremap <silent> <leader>yi     :YcmCompleter GoToInclude<CR>
    noremap <silent> <leader>yt     :YcmCompleter GetType<CR>
    noremap <silent> <leader>jd     :YcmCompleter GoToDefinitionElseDeclaration<CR>
endif

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

function! CreateCHeaderGuard()
    let headername = substitute(toupper(expand("%:t")), "\\.\\|-", "_", "g")
    execute "normal Go#endif".repeat(" ", 38)."//#ifdef ".headername
    execute "normal ggO#ifndef ".headername
    execute "normal o#define ".headername
    execute "normal o"
endfunction

function! s:centered_string(str, ch)
    let maxwidth = (&tw > 0) ? &tw : 78
    let ch_count = (maxwidth - strlen(a:str) - 4) / 2
    if ch_count >= 0
        let padding = maxwidth - (4 + strlen(a:str) + 2*ch_count)
        return repeat(a:ch, ch_count)." ".a:str." ".repeat(a:ch, ch_count + padding)
    else
        return a:str
    endif
endfunction

function! CenterCComment()
    let line = getline(".")
    if match(line, '^\s*\/\/-') >= 0
        call setline(".", "\/\/".s:centered_string(substitute(line, '^\s*\/\/-\(\s\+\)\?\|\s\+$', "", "g"), "-"))
    elseif match(line, '^\s*\/\/') >= 0
        call setline(".", "\/\/".s:centered_string(substitute(line, '^\s*\/\/\(\s\+\)\?\|\s\+$', "", "g"), " "))
    endif
endfunction
