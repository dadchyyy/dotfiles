let g:mapleader = ' '

set encoding=utf-8
set fileencodings=utf-8,euc-jp
set ttimeoutlen=0
set expandtab
set tabstop=2
set softtabstop=-1
set shiftwidth=0
set hlsearch
set incsearch
set wildmenu
set hidden
set noswapfile
set nofixeol
set nowrap
set backspace=eol,indent,start
set nrformats=unsigned
set ignorecase
set ambiwidth=double

if has('termguicolors')
  set termguicolors
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
endif

if has('persistent_undo')
  set undodir=/tmp,.
  set undofile
endif

augroup vimrc_highlights
  autocmd!
  autocmd ColorScheme * call s:highlight_additional()
  function! s:highlight_additional() abort
    highlight Normal ctermbg=NONE guibg=NONE
    highlight SignColumn ctermbg=NONE guibg=NONE
    highlight Terminal guibg=#2e3440
    let g:terminal_ansi_colors = [
          \ '#3b4252', '#bf616a', '#a3be8c', '#ebcb8b', '#81a1c1', '#b48aed', '#88c0d0', '#e5e9f0',
          \ '#4c566a', '#bf616a', '#a3be8c', '#ebcb8b', '#81a1c1', '#b48aed', '#8fbcbb', '#eceff4']
  endfunction
augroup END

nnoremap <silent> <leader>v :vs $MYVIMRC<cr>
nnoremap <silent> <leader>. :so $MYVIMRC<cr>
nnoremap <silent> q :q!<cr>
nnoremap <silent> <leader>- :e %:h<cr>
nnoremap <silent> <c-l> :noh<cr>

augroup vimrc_ft_scss
  autocmd!
  autocmd FileType scss inoremap <buffer> <c-l> $
augroup END

call plug#begin('~/.vim/plugged')
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug '907th/vim-auto-save'
Plug 'mattn/vim-molder' | Plug 'mattn/vim-molder-operations'
Plug 'itchyny/vim-parenmatch'
Plug 'kana/vim-textobj-entire' | Plug 'kana/vim-textobj-user'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround' | Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'SirVer/ultisnips'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'tyru/columnskip.vim'
call plug#end()

" vim-plug
nnoremap <silent> <leader>i :up <bar> so $MYVIMRC <bar> PlugInstall<cr>
nnoremap <silent> <leader>c :up <bar> so $MYVIMRC <bar> PlugClean<cr>

" vim-auto-save
let g:auto_save = 1
let g:auto_save_silent = 1

" material.vim
let g:material_terminal_italics = 0
let g:material_theme_style = 'palenight'
colorscheme material

" vim-molder / vim-molder-operations
let g:molder_show_hidden = 1
augroup vimrc_pi_molder
  autocmd!
  autocmd FileType molder nmap <buffer> h <plug>(molder-up)
  autocmd FileType molder nmap <buffer> l <plug>(molder-open)
augroup END
augroup vimrc_pi_molder_operations
  autocmd!
  autocmd FileType molder nmap <buffer> d <plug>(molder-operations-newdir)
  autocmd FileType molder nmap <buffer> % <plug>(molder-operations-newfile)
  autocmd FileType molder nmap <buffer> D <plug>(molder-operations-delete)
  autocmd FileType molder nmap <buffer> R <plug>(molder-operations-rename)
  nnoremap <plug>(molder-operations-newfile) :call <sid>molder_operations_newfile()<cr>
  function! s:molder_operations_newfile() abort
    let l:name = input('Create File: ')
    if empty(l:name)
      return
    endif
    exec 'e' molder#curdir() . l:name
  endfunction
augroup END

" vim-parenmatch
let g:loaded_matchparen = 1

" fzf.vim
let g:fzf_layout = { 'down': '20%' }
let g:fzf_preview_window = []
let g:fzf_buffers_jump = 1
nnoremap <silent> <c-p> :Files<cr>
nnoremap <silent> <c-k> :Buffers<cr>

" ultisnips
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories = ['~/.vim/ultisnips']
let g:UltiSnipsSnippetAuthor = 'dadchyyy'
nnoremap <leader>u :UltiSnipsEdit<cr>
nnoremap <leader>U :UltiSnipsEdit<space>
nnoremap <leader>t :call <sid>ultisnips_edit_temporary_snippet()<cr>
inoremap <c-f> <c-r>=UltiSnipsTemporarySnippet<cr>
function! s:ultisnips_edit_temporary_snippet() abort
  let l:snippet = input('Temporary Snippet: ')
  if empty(l:snippet)
    return
  endif
  let g:UltiSnipsTemporarySnippet = l:snippet
endfunction

" vim-hexokinase
" let g:Hexokinase_highlighters = ['foreground']
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla'
\ ]

" columnskip.vim
nmap gj <Plug>(columnskip:nonblank:next)
omap gj <Plug>(columnskip:nonblank:next)
xmap gj <Plug>(columnskip:nonblank:next)
nmap gk <Plug>(columnskip:nonblank:prev)
omap gk <Plug>(columnskip:nonblank:prev)
xmap gk <Plug>(columnskip:nonblank:prev)
