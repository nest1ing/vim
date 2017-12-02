set nocompatible            " disable vi compatibility
set noautoindent            " disable autoindent
set nocindent               " disable automatic C program indenting

" More powerful backspacing
set backspace=indent,eol,start

" Configure tabwidth and insert spaces instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Highlight matching braces
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Scroll
set sidescroll=7
set scrolljump=7
set sidescrolloff=7

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" No annoing sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Always show the status line
set laststatus=2

" Format the status line
set statusline=%<%f\ %m%r\ \ Line:\ %l/%L[%P]\ Col:\ %c\ Buf:\ #%n
set noruler
set nomodeline

set t_Co=256

set listchars+=precedes:<,extends:>


set hidden
set nofoldenable
set autoread
set ttyfast
set exrc
set secure
set nowrap

set fileencodings=utf-8,koi8-r,cp1251,imb866

set wildmenu                                    " show enhanced completion
"set wildmode=list:longest                       " together with wildmenu
set wildignore+=.hg,.git,.svn                   " version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*jpeg   " binary images
set wildignore+=*.o,*.sw?,*.pyc

" Define group of commands.
" Commands defined in .vimrc don't bind twice if .vimrc will reload
augroup vimrc
    " Delete any previously defined autocommands
    au!

    " Auto reload vim after you change it
    au BufWritePost *.vim source $MYVIMRC
    au BufWritePost .vimrc source $MYVIMRC
    au BufWritePost vimrc source $MYVIMRC

    " Restore cursor position :help last-position-jump
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif


    autocmd FileType perl :setlocal iskeyword=@,48-57,_,192-255,:

    " Automatically removing all trailing whitespace
    autocmd FileType c,cpp,h,pl,pm,py,vim autocmd BufWritePre <buffer> :%s/\s\+$//e

" Group end
augroup END

if has("termguicolors")
    set termguicolors
endif

if exists('+colorcolumn')
    "set textwidth=110
    set colorcolumn=+1
    set cursorline
endif

if has("gui_running")
    "set guifont=Source\ Code\ Pro\ Regular\ 8
    set guifont=Terminus\ Regular\ 9
    set guioptions=aegit
    set columns=120
    set lines=40
    set mousehide
endif

if has("xterm_clipboard")
    set mouse=a
endif

if &term == "xterm" || &term == "xterm-256color"
    " Fix keycode for Shift + F1-F4 in xterm
    set <S-F1>=[1;2P
    set <S-F2>=[1;2Q
    set <S-F3>=[1;2R
    set <S-F4>=[1;2S
endif

colorscheme mydefault
set background=dark
