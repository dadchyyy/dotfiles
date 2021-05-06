nnoremap q :call <sid>gitcommit_quit()<cr>
function! s:gitcommit_quit() abort
  let l:choice = confirm('Commit?: ', "&yes\n&No", 2)
  if l:choice == 1
    exec 'wq'
  else
    exec 'q!'
  endif
endfunction
