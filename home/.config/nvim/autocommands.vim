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
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType markdown setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab omnifunc=phpcomplete#CompletePHP
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern#Complete

  " automatically resize panes on resize
  autocmd VimResized * exe 'normal! \<c-w>='

  " CoffeeScript
  autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent
  autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

  " Python
  autocmd BufNewFile,BufRead *.py setl ts=4 sts=4 sw=4 tw=79 expandtab autoindent fileformat=unix

  " Markdown
  autocmd BufNewFile,BufRead *.md setlocal ft=markdown
  autocmd BufNewFile,BufRead *.markdown setlocal ft=markdown

  " Stylus
  " autocmd BufNewFile,BufReadPost *.styl set filetype=stylus
  autocmd BufNewFile,BufReadPost *.css set filetype=css
  autocmd BufNewFile,BufRead *.styl set filetype=stylus

  " Enable spellcheck on certain filetypes
  autocmd FileType gitcommit,markdown setlocal spell

  " Enable Neomake
  autocmd! BufWritePost * Neomake

augroup END
