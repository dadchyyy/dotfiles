UsePlugin 'vim-molder'

let g:molder_show_hidden = 1

augroup plugin_molder
  autocmd!
  autocmd FileType molder nmap <buffer><silent> h <plug>(molder-up)
  autocmd FileType molder nmap <buffer><silent> l <plug>(molder-open)
  autocmd FileType molder nmap <buffer><silent> r <plug>(molder-reload)
  autocmd FileType molder nmap <buffer><silent> . <plug>(molder-toggle-hidden)
  autocmd FileType molder nnoremap <buffer><nowait> g gg
augroup END

UsePlugin 'vim-molder-operations'

augroup plugin_molder_operations
  autocmd!
  autocmd FileType molder nmap <buffer><silent><nowait> d <plug>(molder-operations-newdir)
  autocmd FileType molder nmap <buffer><silent> m <plug>(molder-operations-newdir)
  autocmd FileType molder nmap <buffer><silent> D <plug>(molder-operations-delete)
  autocmd FileType molder nmap <buffer><silent> R <plug>(molder-operations-rename)
  autocmd FileType molder nnoremap <buffer> e :e %:p:h<tab>
  autocmd FileType molder nnoremap <buffer> % :e %:p:h<tab>
augroup END
