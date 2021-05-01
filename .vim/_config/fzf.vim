UsePlugin 'fzf.vim'

let g:fzf_layout = { 'down': '20%' }
let g:fzf_preview_window = []

command! -bang ProjectFiles call fzf#vim#files(FindRootDirectory(), <bang>0)
command! -bang DotFiles call fzf#vim#files(expand('$DF'), <bang>0)

nnoremap <c-j> :<c-u>ProjectFiles<cr>
nnoremap <c-k> :<c-u>Buffers<cr>

nnoremap <leader>fd :<c-u>DotFiles<cr>
nnoremap <leader>fh :<c-u>History<cr>
