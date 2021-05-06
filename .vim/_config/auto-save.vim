UsePlugin 'vim-auto-save'

let g:auto_save = 1
let g:auto_save_silent = 1

augroup plugin_auto_save
  autocmd!
  autocmd FileType none let b:auto_save = 0
  autocmd FileType gitcommit let b:auto_save = 0
augroup END
