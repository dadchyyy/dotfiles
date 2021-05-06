UsePlugin 'fzf.vim'

let g:fzf_layout = { 'down': '20%' }
let g:fzf_preview_window = []

nnoremap <c-j> :Directories<cr>
nnoremap <c-p> :Files<cr>
nnoremap <c-k> :Buffers<cr>
nnoremap <c-h> :History<cr>

command! Files call s:fzf_files()
function! s:fzf_files() abort
  call fzf#run(fzf#wrap({'source': 'fd --type f --hidden --exclude *.jpg --exclude *.png --exclude *.svg', 'options': '--multi'}))
endfunction

command! Directories call s:fzf_directories()
function! s:fzf_directories() abort
  call fzf#run(fzf#wrap({'source': 'fd --type d --hidden', 'options': '--multi'}))
endfunction

function! s:fzf_action_newfile(lines) abort
  let l:dir = a:lines[0]
  let l:name = input('Create file: ' . l:dir . '/')

  if empty(l:name)
    return
  endif

  let l:newfile = l:dir . '/' . l:name
  exec 'e' l:newfile
  exec 'w'
endfunction

let g:fzf_action = {
      \ 'ctrl-e': function('s:fzf_action_newfile'),
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}
