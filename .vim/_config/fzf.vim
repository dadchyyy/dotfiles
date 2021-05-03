UsePlugin 'fzf.vim'

let g:fzf_layout = { 'down': '20%' }
let g:fzf_preview_window = []
let g:fzf_colors = {
\	'fg':      ['fg', 'Normal'],
\	'bg':      ['bg', 'Normal'],
\	'hl':      ['fg', 'Comment'],
\	'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\	'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\	'hl+':     ['fg', 'Statement'],
\	'info':    ['fg', 'PreProc'],
\	'border':  ['fg', 'Ignore'],
\	'prompt':  ['fg', 'Conditional'],
\	'pointer': ['fg', 'Exception'],
\	'marker':  ['fg', 'Keyword'],
\	'spinner': ['fg', 'Label'],
\	'header':  ['fg', 'Comment'],
\}

nnoremap <c-p>  :<c-u>FzfFile<cr>
nnoremap <leader>fh :<c-u>FzfFile vs<cr>
nnoremap <leader>fj :<c-u>FzfFile bel sp<cr>
nnoremap <leader>fk :<c-u>FzfFile sp<cr>
nnoremap <leader>fl :<c-u>FzfFile bel vs<cr>
nnoremap <leader>fn :<c-u>FzfNewFile<cr>

command! -nargs=? FzfFile call s:fzf_file(<f-args>)
function! s:fzf_file(...) abort
	let l:root = FindGitRoot()
	if !empty(root)
		let l:source = 'git ls-files -- . ":!:*.jpg" ":!:*.png" ":!:*.svg" && fd --type f --hidden . $DF'
	else
		let l:source = 'fd --type f --hidden . ~'
	endif
	if a:0
		call fzf#run(fzf#wrap({'source': l:source, 'sink': a:1}))
	else
		call fzf#run(fzf#wrap({'source': l:source}))
	endif
endfunction

command! -nargs=0 FzfNewFile call s:fzf_search_dir()
function! s:fzf_search_dir() abort
	call fzf#run(fzf#wrap({'source': 'fd --type d --hidden . ~'}))
endfunction

function! s:fzf_action_newfile(lines) abort
	let s:dir = a:lines[0]
	let s:basename = input('newfile: ' . s:dir . '/')
	let s:newfile = s:dir . '/' . s:basename
	exec 'e' s:newfile
	exec 'w'
endfunction

let g:fzf_action = {
\	'ctrl-e': function('s:fzf_action_newfile'),
\	'ctrl-t': 'tab split',
\	'ctrl-x': 'split',
\	'ctrl-v': 'vsplit'
\}
