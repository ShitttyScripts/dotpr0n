call plug#begin()

Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'elixir-lang/vim-elixir'
Plug 'posva/vim-vue'
Plug 's3rvac/AutoFenc'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'JulesWang/css.vim', { 'for': 'css' }
Plug 'Konfekt/FastFold'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'airblade/vim-gitgutter'
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'bling/vim-airline'
Plug 'carlitux/deoplete-ternjs'
Plug 'chriskempson/base16-vim'
Plug 'diepm/vim-rest-console'
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'evidens/vim-twig'
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'godlygeek/tabular'
Plug 'joonty/vim-sauce'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kchmck/vim-coffee-script'
Plug 'kshenoy/vim-signature'
Plug 'm2mdas/phpcomplete-extended'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'mhinz/vim-startify'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
Plug 'nelstrom/vim-visual-star-search'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'othree/jspc.vim', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' } | Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'reedes/vim-wheel'
Plug 'rking/ag.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree/', { 'on': 'NERDTreeToggle' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux'
Plug 'tobyS/pdv', { 'for': 'php' }
Plug 'tomtom/tcomment_vim'
Plug 'toyamarinyon/vim-swift', { 'for': 'swift' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-liquid', { 'for': 'liquid' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'vim-scripts/hexHighlight.vim', { 'for': ['css', 'stylus'] }
Plug 'vim-scripts/nginx.vim', { 'for': 'nginx' }
Plug 'vim-scripts/progressbar-widget'
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'wdalmut/vim-phpunit', { 'for': 'php' }
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

if !empty(glob('$HOME/.config/nvim/plugins.local'))
   source $HOME/.config/nvim/plugins.local
endif

call plug#end()

if !empty(glob('$HOME/.config/nvim/plugin-settings.vim'))
   source $HOME/.config/nvim/plugin-settings.vim
endif
