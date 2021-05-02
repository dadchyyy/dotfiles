set number
setglobal laststatus=2
setglobal cmdheight=2
set list
setglobal listchars=tab:»-,eol:¬
setglobal ttimeoutlen=0
setglobal backspace=indent,eol,start
set nowrap
setglobal ignorecase
setglobal smartcase
setglobal pumheight=5
set softtabstop=-1
set shiftwidth=0

if has('termguicolors')
	let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
	let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
	setglobal termguicolors
endif

if has('persistent_undo')
	set undofile
	setglobal undodir=~/.vim/undodir
endif

if has('extra_search')
	setglobal hlsearch
	setglobal incsearch
endif

if has('signs')
	set signcolumn=number
endif

let g:did_install_default_menus = 1
let g:did_install_syntax_menu   = 1
let g:loaded_2html_plugin       = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_gzip               = 1
let g:loaded_netrw              = 1
let g:loaded_netrwFileHandlers  = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
let g:loaded_rrhelper           = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let g:skip_loading_mswin        = 1

let g:mapleader = ' '

nnoremap <leader>v :<c-u>vs $MYVIMRC<cr>
nnoremap <leader>V :<c-u>so $MYVIMRC<cr>
nnoremap q :q!<cr>
nnoremap <leader>q q
nnoremap @ @q
cnoremap <c-b> <left>
cnoremap <c-n> <down>
cnoremap <c-p> <up>
cnoremap <c-f> <right>
cnoremap <c-a> <home>
nnoremap <leader>mm :<c-u>e %:p:h<cr>
nnoremap <leader>mh :<c-u>vs %:p:h<cr>
nnoremap <leader>mj :<c-u>bel sp %:p:h<cr>
nnoremap <leader>mk :<c-u>sp %:p:h<cr>
nnoremap <leader>ml :<c-u>bel vs %:p:h<cr>
nnoremap cl' 2f"ci'
nnoremap cl" 2f"ci"
nnoremap ch' 2F"ci'
nnoremap ch" 2F"ci"
nnoremap <c-l> :<c-u>noh<cr>
nnoremap cg* *Ncgn

augroup vimrc_auto_mkdir
	autocmd!
	autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
	function! s:auto_mkdir(dir, force)
		if !isdirectory(a:dir) && (a:force ||
					\    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
			call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
		endif
	endfunction
augroup END

if $HOME != $USERPROFILE && $GIT_EXEC_PATH != ''
	finish
end

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'mattn/vim-molder'
Plug '907th/vim-auto-save'
Plug 'junegunn/fzf.vim' | Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-rooter'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'tomtom/tcomment_vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'SirVer/ultisnips'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'
Plug 'AndrewRadev/tagalong.vim'
call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! _config/*.vim
