set shell=/bin/sh
if !has('nvim')
  set encoding=utf-8
end
scriptencoding utf-8
" Plugins {{{
call plug#begin()

Plug 'Shougo/deoplete.nvim'
" Plug 'Shutnik/jshint2.vim'
" Plug 'chriskempson/base16-vim'
" Plug 'davidoc/taskpaper.vim'
" Plug 'ervandew/supertab'
" Plug 'godlygeek/csapprox'
" Plug 'guns/xterm-color-table.vim'
" Plug 'itspriddle/vim-marked'
" Plug 'majutsushi/tagbar'
" Plug 'mattn/webapi-vim'
" Plug 'scrooloose/syntastic'
" Plug 'skammer/vim-css-color'
" Plug 'tobyS/pdv'
" Plug 'tobyS/vmustache'
Plug 'xolox/vim-session'
Plug 'Chiel92/vim-autoformat'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
" Plug 'Valloric/YouCompleteMe', { 'dir': '~/.config/nvim/plugged/YouCompleteMe', 'do': './install.py --clang-completer --tern-completer' }
Plug 'airblade/vim-gitgutter'
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'dag/vim-fish'
Plug 'diepm/vim-rest-console'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'godlygeek/tabular'
Plug 'herrbischoff/cobalt2.vim'
Plug 'joonty/vim-sauce'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
Plug 'nelstrom/vim-visual-star-search'
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'othree/jspc.vim', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'parkr/vim-jekyll'
" Plug 'phpvim/phpcd.vim', { 'for': 'php' }
Plug 'reedes/vim-wheel'
Plug 'rizzatti/dash.vim'
Plug 'rking/ag.vim'
" Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/hexHighlight.vim', { 'for': ['css', 'stylus'] }
Plug 'vim-scripts/progressbar-widget'
Plug 'wakatime/vim-wakatime'
Plug 'wdalmut/vim-phpunit', { 'for': 'php' }
Plug 'xolox/vim-misc'

Plug 'm2mdas/phpcomplete-extended'
Plug 'scrooloose/nerdtree/'

call plug#end()
" }}}
" Colors {{{
" set t_Co=256
colorscheme gruvbox
highlight Comment cterm=italic
set background=dark
syntax enable " enable syntax processing
" }}}
" Mouse {{{
set mouse=a " Enable mouse use in all modes
" }}}
" Misc {{{
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
" }}}
" Spaces & Tabs {{{
set autoindent " autoindent based on line above, works most of the time
set copyindent " copy the previous indentation on autoindenting
set expandtab " use spaces instead of tabs
set shiftwidth=2 " when reading, tabs are 2 spaces
set smartindent " smarter indent for C-like languages
set softtabstop=2 " in insert mode, tabs are 2 spaces
" }}}
" UI Layout {{{
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
set breakindent
set colorcolumn=80 " Make a mark for column 80
set cursorline
set diffopt+=vertical
set formatoptions+=or
set laststatus=2
set linebreak
set linespace=2 " Set line spacing
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set modelines=1
set nocursorcolumn " Do not highlight column
set nolist
set number
set numberwidth=4
set ruler
set scrolloff=3 " Keep the cursor visible within 3 lines when scrolling
set showbreak=↪ " Show line wrapping
set splitbelow
set splitright
set textwidth=0 " turn off hard word wrapping
set wrap
set wrapmargin=0
syntax sync minlines=256 " Start highlighting from 256 lines backwards
" }}}
" Searching {{{
set gdefault
set hlsearch " highlight searches by default
set ignorecase
set incsearch " find the next match as we type the search
set showmatch
set smartcase
" }}}
" Folding {{{
set foldenable " enable folding
set foldlevelstart=99 " open most folds by default
set foldmethod=indent " fold based on indent level
" }}}
" Leader Shortcuts {{{
let g:mapleader = ' '

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" map <leader>, and <leader>. to buffer prev/next buffer
noremap <leader>, :bp<CR>
noremap <leader>. :bn<CR>
" }}}
" jsx {{{
let g:jsx_ext_required = 1 " Allow JSX in normal JS files
" }}}
" Gruvbox {{{
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
" }}}
" NerdTree {{{
map - :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" }}}
" UltiSnips {{{
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<s-tab>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsEditSplit='vertical'
" }}}
" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
nnoremap <silent> <F4> :call <SID>StripTrailingWhitespaces()<CR>
" }}}
" ctrlp {{{
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn))|(node_modules|bower_components|dist)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
nmap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>c :CtrlPTag<cr>
" }}}
" editorconfig {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
" }}}
" TagBar {{{
" nmap <F8> :TagbarToggle<CR>
" }}}
" Dash {{{
nmap <silent> <leader>d <Plug>DashSearch
let g:dash_map = {
  \ 'stylus' : ['css', 'stylus']
  \ }
" }}}
" Gundo {{{
nnoremap <leader>u :GundoToggle<CR>
" }}}
" vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" HexHighlight {{{
if exists('*HexHighlight()')
  nnoremap <leader>h :call HexHighlight()<Return>
endif
" }}}
" {{{ Multiple Cursors
let g:multi_cursor_exit_from_visual_mode = 0
" }}}
" Fugitive {{{
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gc :Gcommit %<CR>i
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>
" }}}
" vim-indent-guides {{{
let g:indent_guides_enable_on_vim_startup = 1
"}}}
" {{{ delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
" }}}
" Supertab {{{
" let g:SuperTabDefaultCompletionType = 'context'
" " let g:SuperTabContextDefaultCompletionType = '<C-x><C-o>'
" let g:SuperTabContextDefaultCompletionType = ''
" }}}
" vimtex {{{
let g:vimtex_view_general_viewer = '/usr/local/bin/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_view_general_options_latexmk = '-r 1'
let g:vimtex_latexmk_callback = 0
" }}}
" deoplete {{{
set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
let g:deoplete#enable_ignore_case = 'ignorecase'
" https://github.com/Shougo/neocomplete.vim/blob/master/autoload/neocomplete/sources/omni.vim
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.html = '<[^>]*'
let g:deoplete#omni_patterns.xml  = '<[^>]*'
let g:deoplete#omni_patterns.md   = '<[^>]*'
let g:deoplete#omni_patterns.css   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.scss   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.sass   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
let g:deoplete#omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:deoplete#omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:deoplete#omni_patterns.go = '[^.[:digit:] *\t]\.\w*'
let g:deoplete#omni_patterns.ruby = ['[^. *\t]\.\w*', '\h\w*::']
let g:deoplete#omni_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:deoplete#omni_patterns.python = ['[^. *\t]\.\h\w*\','\h\w*::']
let g:deoplete#omni_patterns.python3 = ['[^. *\t]\.\h\w*\','\h\w*::']
autocmd CmdwinEnter * let b:deoplete_sources = ['buffer']
" let g:deoplete#omni_patterns = {
"   \ 'php': '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" \ }
" if !exists('g:deoplete#keyword_patterns')
"   let g:deoplete#keyword_patterns = {}
" endif
" let g:deoplete#keyword_patterns.default = '[a-zA-Z_]\w{2,}?'
let g:deoplete#disable_auto_complete = 1
imap     <Nul> <C-Space>
inoremap <expr><C-Space> deoplete#mappings#manual_complete()
inoremap <expr><BS>      deoplete#mappings#smart_close_popup()."\<C-h>"
" }}}
" neomake {{{
nmap <Leader>o :lopen<CR> " open location window
nmap <Leader>c :lclose<CR> " close location window
" nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader>n :lnext<CR>      " next error/warning
nmap <Leader>p :lprev<CR>      " previous error/warning
autocmd! BufEnter * Neomake
autocmd! QuitPre * let g:neomake_verbose = 0
" }}}
" YouCompleteMe {{{
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]
" let g:ycm_key_invoke_completion = ''
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" }}}
" emmet {{{
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-Z>'
" }}}
" vim-session {{{
let g:session_autosave = 'no'
set sessionoptions-=options " Don't persist options and mappings because it can corrupt sessions.
" }}}
" AutoGroups {{{
augroup configgroup
  autocmd VimEnter * highlight clear SignColumn
  autocmd FileType netrw nmap <silent> <buffer> <Esc> :bd<cr>

  " Filetypes
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  " autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType c setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType fish setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType html EmmetInstall
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType markdown setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab omnifunc=phpcomplete#CompletePHP
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " if exists('g:plugs["tern_for_vim"]')
  "   let g:tern_show_argument_hints = 'on_hold'
  "   let g:tern_show_signature_in_pum = 1
  "
  "   autocmd FileType javascript setlocal omnifunc=tern#Complete
  " endif

  " Python
  au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

  " Markdown
  autocmd BufNewFile,BufRead *.md setlocal ft=markdown
  autocmd BufNewFile,BufRead *.markdown setlocal ft=markdown

  " Stylus
  autocmd BufNewFile,BufReadPost *.styl set filetype=stylus
  autocmd BufNewFile,BufReadPost *.css set filetype=css
  autocmd BufNewFile,BufRead *.styl set filetype=stylus

  " Enable spellcheck on certain filetypes
  autocmd FileType gitcommit,markdown setlocal spell

  " Enable Neomake
  autocmd! BufWritePost * Neomake

  " Strip trailing whitespace on save
  autocmd BufWritePre *.py,*.js,*.php,*.twig,*.coffee,*.jade,*.html :call <SID>StripTrailingWhitespaces()

augroup END
" }}}
" Backups {{{
set nobackup
set backupdir=~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.tmp,~/tmp,/var/tmp,/tmp
set history=1000
set undodir=~/.tmp " set undo file location
set undofile
set undolevels=1000 " use many muchos levels of undo
set writebackup
" }}}
" Key mappings {{{
" Disable arrow keys
" inoremap <Left>  <NOP>
" inoremap <Right> <NOP>
" inoremap <Up>    <NOP>
" inoremap <Down>  <NOP>
" nnoremap <Left>  <NOP>
" nnoremap <Right> <NOP>
" nnoremap <Up>    <NOP>
" nnoremap <Down>  <NOP>

xmap ' S'
xmap " S"
xmap [ S[
xmap { S{
xmap ( S(

" Toggle paste mode
set pastetoggle=<F2>

" Make x not overwrite yank buffer
nnoremap x "_x

" Sort
vnoremap <silent> <F5> :sort<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Fast quit
nmap <leader>q :q!<cr>

" Delete current buffer
nmap <A-w> :bd<CR>

" Do not show stupid q: window
map q: :q

" Use <C-Space> for Vim's keyword autocomplete
" inoremap <Nul> <C-n>
" inoremap <C-Space> <C-n>

" inoremap <C-space> <C-x><C-o>

" Backtick to toggle folds
nnoremap ` za
vnoremap ` za
nnoremap ~ zM
vnoremap ~ zM

" Make Y not dumb
nnoremap Y y$

" Opens nvim config for editing
nmap <Leader>v :e ~/.config/nvim/init.vim<CR>

" Map arrow keys to screen line movement instead of buffer movement
" map <Up> gk
" map <Down> gj
" map k gk
" map j gj

" Disable Ex mode
nnoremap Q <nop>

" Search centers result
nnoremap n nzzzv
nnoremap N Nzzzv

" Quick escaping in insert mode
inoremap jj <ESC>
inoremap \\ <ESC>

" Enable w!! for saving file with root privileges
cmap w!! w !sudo tee % >/dev/null

nnoremap <space>f :Files<CR>

" Switch between windows with <A-Tab>
nnoremap <A-Tab> <C-w>w

" Switch windows
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Enable key mapping for moving lines up and down, somehow need to be the last
" entry in keymaps
nnoremap <silent> <C-Down> :m .+1<CR>==
nnoremap <silent> <C-Up> :m .-2<CR>==
inoremap <silent> <C-Down> <Esc>:m .+1<CR>==gi
inoremap <silent> <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <silent> <C-Down> :m '>+1<CR>gv=gv
vnoremap <silent> <C-Up> :m '<-2<CR>gv=gv
" }}}
" Custom Functions {{{
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let l:_s=@/
  let l:l = line('.')
  let l:c = col('.')
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=l:_s
  call cursor(l:l, l:c)
endfunction
" }}}

" vim:foldmethod=marker:foldlevel=0
