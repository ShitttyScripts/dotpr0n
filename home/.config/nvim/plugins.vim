call plug#begin()

" Plug 'Shutnik/jshint2.vim'
" Plug 'Valloric/YouCompleteMe', { 'dir': '~/.config/nvim/plugged/YouCompleteMe', 'do': './install.py --clang-completer --tern-completer' }
" Plug 'chriskempson/base16-vim'
" Plug 'ervandew/supertab'
" Plug 'godlygeek/csapprox'
" Plug 'guns/xterm-color-table.vim'
" Plug 'itspriddle/vim-marked'
" Plug 'kien/ctrlp.vim'
" Plug 'majutsushi/tagbar'
" Plug 'mattn/webapi-vim'
" Plug 'phpvim/phpcd.vim', { 'for': 'php' }
" Plug 'scrooloose/syntastic'
" Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
" Plug 'skammer/vim-css-color'
" Plug 'tobyS/pdv'
" Plug 'tobyS/vmustache'
Plug 'Chiel92/vim-autoformat'
Plug 'JulesWang/css.vim'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'airblade/vim-gitgutter'
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'dag/vim-fish'
Plug 'davidoc/taskpaper.vim'
Plug 'diepm/vim-rest-console'
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'evidens/vim-twig'
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'godlygeek/tabular'
Plug 'herrbischoff/cobalt2.vim'
Plug 'joonty/vim-sauce'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kchmck/vim-coffee-script'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'm2mdas/phpcomplete-extended'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'mhinz/vim-startify'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
Plug 'nelstrom/vim-visual-star-search'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'othree/jspc.vim', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' } | Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'parkr/vim-jekyll'
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-wheel'
Plug 'rizzatti/dash.vim'
Plug 'rking/ag.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree/'
Plug 'sjl/gundo.vim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux'
Plug 'tomtom/tcomment_vim'
Plug 'toyamarinyon/vim-swift'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/hexHighlight.vim', { 'for': ['css', 'stylus'] }
Plug 'vim-scripts/nginx.vim'
Plug 'vim-scripts/progressbar-widget'
Plug 'wakatime/vim-wakatime'
Plug 'wavded/vim-stylus'
Plug 'wdalmut/vim-phpunit', { 'for': 'php' }
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

call plug#end()

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" ctrlp
" let g:ctrlp_working_path_mode = 'c'
" let g:ctrlp_custom_ignore = {
"       \ 'dir':  '\v[\/](\.(git|hg|svn))|(node_modules|bower_components|dist)$',
"       \ 'file': '\v\.(exe|so|dll)$',
"       \ }
" nnoremap <leader>b :CtrlPBuffer<CR>
" nnoremap <leader>c :CtrlPTag<cr>

" Dash
noremap <silent> <leader>d <Plug>DashSearch
let g:dash_map = {
  \ 'stylus' : ['css', 'stylus']
  \ }

" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1

" deoplete
set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
set completeopt+=noinsert
let g:deoplete#enable_ignore_case = 'ignorecase'
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
imap     <Nul> <C-Space>
inoremap <expr><C-Space> deoplete#mappings#manual_complete()
inoremap <expr><BS>      deoplete#mappings#smart_close_popup()."\<C-h>"

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_exec_path        = '/usr/local/bin/editorconfig'

" emmet
let g:user_emmet_mode           = 'a'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key     = '<C-Z>'

" Fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gc :Gcommit %<CR>i
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>

" fzf
let $FZF_DEFAULT_COMMAND= 'ag -g ""'
nnoremap <space>b :Buffers<CR>
nnoremap <space>f :Files<CR>

" Gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" HexHighlight {{{
if exists('*HexHighlight()')
  nnoremap <leader>h :call HexHighlight()<Return>
endif

" javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,underscore,react'

" jsx
let g:jsx_ext_required = 1 " Allow JSX in normal JS files

" Multiple Cursors
let g:multi_cursor_exit_from_visual_mode = 0

" neomake
noremap <Leader>o :lopen<CR> " open location window
noremap <Leader>c :lclose<CR> " close location window
" noremap <Leader><Space>, :ll<CR>         " go to current error/warning
noremap <Leader>n :lnext<CR>      " next error/warning
noremap <Leader>p :lprev<CR>      " previous error/warning
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePre * Neomake
autocmd! QuitPre * let g:neomake_verbose = 0

" NerdTree
map - :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable  = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" UltiSnips
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsListSnippets        = '<s-tab>'
let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit           = 'vertical'

" Vim Better Whitespace
autocmd BufWritePre * StripWhitespace
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']

" vim-easy-align
xnoremap ga <Plug>(EasyAlign) " Start interactive EasyAlign in visual mode (e.g. vipga)
nnoremap ga <Plug>(EasyAlign) " Start interactive EasyAlign for a motion/text object (e.g. gaip)

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

" vim-session
let g:session_autosave = 'no'
set sessionoptions-=options " Don't persist options and mappings because it can corrupt sessions.

" vimtex
let g:vimtex_view_general_viewer          = '/usr/local/bin/displayline'
let g:vimtex_view_general_options         = '-r @line @pdf @tex'
let g:vimtex_view_general_options_latexmk = '-r 1'
let g:vimtex_latexmk_callback             = 0
