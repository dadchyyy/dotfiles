UsePlugin 'vim-plug'

augroup plugin_plug
  autocmd!
  autocmd BufRead,BufNewFile .vimrc nnoremap <buffer><silent> <leader>i :up <bar> so $MYVIMRC <bar> PlugInstall<cr>
  autocmd BufRead,BufNewFile .vimrc nnoremap <buffer><silent> <leader>c :up <bar> so $MYVIMRC <bar> PlugClean<cr>
augroup END
