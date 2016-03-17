set shell=/bin/sh

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/ui.vim
source $HOME/.config/nvim/autocommands.vim
source $HOME/.config/nvim/bindings.vim
source $HOME/.config/nvim/functions.vim

filetype plugin indent on
set autoread " Reload files changed outside vim
set backspace=indent,eol,start " Enable delete over line breaks and automatically-inserted indentation
set clipboard=unnamed
set fileencoding=utf-8
set fileformat=unix " Set unix line endings
set fileformats=unix,mac,dos
set hidden " Don't unload buffers when they are abandoned, instead stay in the background
set lazyredraw " Screen will not be redrawn while running macros, registers or other non-typed comments
set noerrorbells
set nospell
set shortmess+=I
set viminfo='100,f1 " Save up to 100 marks, enable capital marks
set visualbell " Turn off audible bell

set wildmenu
set wildmode=longest,list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                       " Go static files
set wildignore+=go/bin                       " Go bin files
set wildignore+=go/bin-vagrant               " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
" set complete=.,w,b,u,t
" set completeopt=longest,menuone
" set omnifunc=syntaxcomplete#Complete

set nobackup
set backupdir=~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.tmp,~/tmp,/var/tmp,/tmp
set history=1000
set undodir=~/.tmp " set undo file location
set undofile
set undolevels=1000 " use many muchos levels of undo
set writebackup

" vim:foldmethod=marker:foldlevel=0
