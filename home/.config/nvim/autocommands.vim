augroup configgroup
  autocmd VimEnter * highlight clear SignColumn
  " autocmd FileType netrw nmap <silent> <buffer> <Esc> :bd<cr>

  " Filetypes
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
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
