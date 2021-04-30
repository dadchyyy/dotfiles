let g:mapleader = ' '

set ttimeoutlen=0
set nowrap
set list
set listchars=tab:»-,eol:¬
set number
set scrolloff=10
set hlsearch
set incsearch

" Indentation.
set autoindent
set smartindent
set shiftround
set softtabstop=-1
set shiftwidth=0
augroup vimrc_indentation
	autocmd!
	autocmd FileType html          expandtab tabstop=2
	autocmd FileType css           expandtab tabstop=2
	autocmd FileType scss          expandtab tabstop=2
	autocmd FileType php           expandtab tabstop=4
	autocmd FileType *wordpress* noexpandtab tabstop=4
	autocmd FileType python        expandtab tabstop=4
augroup END

" Appearance.
set termguicolors

" Define my highlights for all colorschemes.
function! s:basic_highlights() abort
	highlight Normal cterm=NONE guibg=NONE
endfunction

" Apply my highlights.
augroup vimrc_highlight_additional
	autocmd!
	autocmd ColorScheme * call s:basic_highlights()
augroup END

" Vimrc.
nnoremap <leader>v :<c-u>vsplit $MYVIMRC<cr>
nnoremap <leader>. :<c-u>source $MYVIMRC<cr>

" Quit.
nnoremap q :<c-u>q!<cr>

" Reset search highlight.
nnoremap <c-l> :<c-u>noh<cr>

call plug#begin('~/.vim/plugged')
" Read vim help in Japanese.
Plug 'vim-jp/vimdoc-ja'
" Launguage packs.
let g:polyglot_disabled = ['autoindent', 'sensible'] | Plug 'sheerun/vim-polyglot'
" Colorscheme.
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Lightweight matchparen.
Plug 'itchyny/vim-parenmatch'
" Lightweight filer.
Plug 'mattn/vim-molder'
" Autosave.
Plug '907th/vim-auto-save'
" Operator-like.
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround' | Plug 'tpope/vim-repeat'
Plug 'thinca/vim-visualstar'
" Textobj.
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'lucapette/vim-textobj-underscore'
call plug#end()

" If vim-plug is installed.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if !empty(glob(data_dir . '/autoload/plug.vim'))
	" Easy install/uninstall.
	augroup vimrc_plugin_plug
		autocmd!
		autocmd BufRead .vimrc nnoremap <buffer> <leader>i :<c-u>source $MYVIMRC <bar> PlugInstall<cr>
		autocmd BufRead .vimrc nnoremap <buffer> <leader>c :<c-u>source $MYVIMRC <bar> PlugClean<cr>
	augroup END

	" Check the specified plugin is installed.
	function! s:is_plugged(name) abort
	if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
		return 1
	else
		return 0
	endif
	endfunction
endif

" If vimdoc-ja is installed.
if s:is_plugged('vimdoc-ja')
	set helplang=ja
endif

" If material.vim is installed.
if s:is_plugged('material.vim')
	let g:material_terminal_italics = 1
	let g:material_theme_style = 'palenight'

	" Define my highlights for the material colorscheme.
	function! s:material_highlights() abort
		if g:material_theme_style == 'palenight'
			highlight SpecialKey ctermfg=60 guifg=#3a3f58
			highlight LineNr term=bold cterm=italic ctermfg=60 gui=italic guifg=#676e95
			highlight! link MatchParen Search
		endif
	endfunction

	" Apply my highlights.
	augroup vimrc_plugin_material
		autocmd!
		autocmd ColorScheme material call s:material_highlights()
	augroup END

	" Set colorscheme.
	silent! colorscheme material
endif

" If vim-parenmatch is installed.
if s:is_plugged('vim-parenmatch')
	let g:loaded_matchparen = 1
	let g:parenmatch_highlight = 0
	highlight link ParenMatch MatchParen
endif

" If vim-molder is installed.
if s:is_plugged('vim-molder')
	augroup vimrc_plugin_molder
		autocmd!
		autocmd FileType molder nmap <buffer> h <plug>(molder-up)
		autocmd FileType molder nmap <buffer> l <plug>(molder-open)
		autocmd FileType molder nmap <buffer> . <plug>(molder-toggle-hidden)
		autocmd FileType molder nmap <buffer> r <plug>(molder-reload)
		autocmd FileType molder nnoremap <buffer><nowait> g gg
	augroup END
endif

" If vim-auto-save is installed.
if s:is_plugged('vim-auto-save')
	let g:auto_save = 1
	
	augroup vimrc_plugins_auto_save
		autocmd!
		autocmd FileType gitcommit let b:auto_save = 0
		autocmd FileType diff let b:auto_save = 0
	augroup END
endif
