UsePlugin 'vim-plug'

autocmd BufRead,BufNewFile .vimrc nnoremap <buffer> <leader>i :<c-u>so $MYVIMRC <bar> PlugInstall<cr>
autocmd BufRead,BufNewFile .vimrc nnoremap <buffer> <leader>c :<c-u>so $MYVIMRC <bar> PlugClean<cr>
