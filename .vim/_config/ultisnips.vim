UsePlugin 'ultisnips'

let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetDirectories=['~/.vim/ultisnips']
let g:UltiSnipsSnippetAuthor='dadchyyy'

nnoremap <leader>u :UltiSnipsEdit<cr>
nnoremap <leader>U :UltiSnipsEdit<space>

augroup plugin_ultisnips
  autocmd!
  autocmd FileType css,scss nnoremap <buffer> <leader>u :UltiSnipsEdit css<cr>
  autocmd FileType css,scss nnoremap <buffer> <leader>U :UltiSnipsEdit scss<cr>
augroup END
