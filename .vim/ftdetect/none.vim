autocmd BufEnter * call s:ftdetect_none()

function! s:ftdetect_none() abort
	if @% == ''
		setlocal filetype=none
	endif
endfunction
