" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
"
" " Enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
"
" " :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
"
" " Completion sources from
" " https://github.com/ncm2/ncm2/wiki
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-cssomni'
" Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
" Plug 'ncm2/ncm2-ultisnips'
" Plug 'ncm2/ncm2-tagprefix'
"
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
