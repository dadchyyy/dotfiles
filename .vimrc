set autoindent
set expandtab
set tabstop=2
set softtabstop=-1
set shiftwidth=0
set nowrap
set ttimeoutlen=0
set backspace=indent,eol,start
set backupcopy=yes
set wildcharm=<tab>
set laststatus=2

if has('termguicolors')
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
  set termguicolors
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

nnoremap <leader>v :vs $MYVIMRC<cr>
nnoremap <leader>V :so $MYVIMRC<cr>
nnoremap q :q!<cr>
cnoremap <c-b> <left>
cnoremap <c-n> <down>
cnoremap <c-p> <up>
cnoremap <c-f> <down>
cnoremap <c-a> <home>
nnoremap ch' 2F'ci'
nnoremap ch" 2F"ci"
nnoremap cl' 2f'ci'
nnoremap cl" 2f"ci"
nnoremap <leader>- :e %:h<cr>
nnoremap <c-l> :noh<cr>

augroup vimrc_auto_mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
          \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
let g:polyglot_disabled = ['autoindent', 'sensible'] | Plug 'sheerun/vim-polyglot'
Plug 'kaicataldo/material.vim'
Plug '907th/vim-auto-save'
Plug 'junegunn/fzf.vim' | Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-rooter'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround' | Plug 'tpope/vim-repeat'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'tomtom/tcomment_vim'
Plug 'aeke/vim-php-cs-fixer'
Plug 'mattn/vim-molder'
Plug 'mattn/vim-molder-operations'
Plug 'akiyan/vim-textobj-php'
Plug 'vim-jp/vimdoc-ja'
call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! _config/*.vim
