Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {}
let g:LanguageClient_serverCommands = {
   \ 'javascript': ['javascript-typescript-stdio'],
   \ 'python': ['pyls'],
   \ 'vue': ['vls']
   \ }

" Use LanguageServer for omnifunc completion
autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
autocmd FileType python setlocal omnifunc=LanguageClient#complete
autocmd FileType vue setlocal omnifunc=LanguageClient#complete

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

autocmd FileType javascript,python nnoremap <buffer>
    \ <leader>lf :call LanguageClient_textDocument_documentSymbol()<cr>
