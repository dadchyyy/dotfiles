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

function! s:set_ft_none() abort
  if @% == ""
    :setlocal filetype=none
  endif
endfunction
augroup vimrc_ftdetect
	autocmd!
	autocmd BufEnter * call s:set_ft_none()
	autocmd BufEnter */wp-content/*html let b:wordpress_buffer = 1
	autocmd BufEnter */wp-content/*css  let b:wordpress_buffer = 1
	autocmd BufEnter */wp-content/*scss let b:wordpress_buffer = 1
	autocmd BufEnter */wp-content/*php  let b:wordpress_buffer = 1
augroup END

runtime ftplugin/man.vim
augroup vimrc_ft_man
	autocmd!
	autocmd FileType man setlocal nolist nomodifiable
augroup END

set ttimeoutlen=0
set nowrap
set list
set listchars=tab:»-,eol:¬
set number
set pumheight=5
set signcolumn=number
set scrolloff=10
set hlsearch
set incsearch
set backspace=eol,indent,start
set updatetime=200
set wildmenu

" Indentation.
set autoindent
set smartindent
set shiftround
set softtabstop=-1
set shiftwidth=0
augroup vimrc_indentation
	autocmd!
	autocmd FileType html               setlocal    expandtab tabstop=2
	autocmd FileType css                setlocal    expandtab tabstop=2
	autocmd FileType scss               setlocal    expandtab tabstop=2
	autocmd FileType php                setlocal    expandtab tabstop=4
	autocmd BufEnter */wp-content/*html setlocal  noexpandtab tabstop=4
	autocmd BufEnter */wp-content/*css  setlocal  noexpandtab tabstop=4
	autocmd BufEnter */wp-content/*scss setlocal  noexpandtab tabstop=4
	autocmd BufEnter */wp-content/*php  setlocal  noexpandtab tabstop=4
	autocmd FileType python             setlocal    expandtab tabstop=4
	autocmd Filetype vim                setlocal  noexpandtab tabstop=4
augroup END

" Show true color correctly.
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set termguicolors

" Define my highlights for all colorschemes (Alacritty's colorscheme is Nord).
function! s:basic_highlights() abort
	highlight Normal cterm=NONE guibg=NONE
	highlight Terminal guibg=#2e3440
	let g:terminal_ansi_colors = [
				\ "#3B4252",
				\ "#BF616A",
				\ "#A3BE8C",
				\ "#EBCB8B",
				\ "#81A1C1",
				\ "#B48EAD",
				\ "#88C0D0",
				\ "#E5E9F0",
				\ "#4C566A",
				\ "#BF616A",
				\ "#A3BE8C",
				\ "#EBCB8B",
				\ "#81A1C1",
				\ "#B48EAD",
				\ "#8FBCBB",
				\ "#ECEFF4"
				\ ]
endfunction

" Apply my highlights.
augroup vimrc_highlight_additional
	autocmd!
	autocmd ColorScheme * call s:basic_highlights()
augroup END

let g:mapleader = ' '

" Vimrc.
nnoremap <leader>v :<c-u>vsplit $MYVIMRC<cr>
nnoremap <leader>. :<c-u>source $MYVIMRC<cr>

" Quit.
nnoremap q :<c-u>q!<cr>

" Reset search highlight.
nnoremap <c-l> :<c-u>noh<cr>

" Textobj.
nnoremap ch' 2F'ci'
nnoremap cl' 2f'ci'
nnoremap ch" 2F"ci"
nnoremap cl" 2f"ci"

call plug#begin('~/.vim/plugged')
" Appearance.
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Behavior.
Plug 'vim-jp/vimdoc-ja'
Plug 'itchyny/vim-parenmatch'
Plug 'mattn/vim-molder'
Plug '907th/vim-auto-save'

" Integration.
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Operator.
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround' | Plug 'tpope/vim-repeat'
Plug 'thinca/vim-visualstar'

" Textobj.
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'lucapette/vim-textobj-underscore'

" Language/Syntax.
let g:polyglot_disabled = ['autoindent', 'sensible'] | Plug 'sheerun/vim-polyglot'
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
	let g:material_theme_style = 'palenight'

	" Define my highlights for the material colorscheme.
	function! s:material_highlights() abort
		if g:material_theme_style == 'palenight'
			highlight SpecialKey ctermfg=60 guifg=#3a3f58
			highlight LineNr term=bold ctermfg=60 guifg=#676e95
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

" If vim-hexokinase is installed.
if s:is_plugged('vim-hexokinase')
	let g:Hexokinase_ftEnabled = ['css', 'scss', 'json', 'yaml', 'vim']
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

" If vim-lsp is installed.
if s:is_plugged('vim-lsp')
	let g:lsp_diagnostics_echo_cursor = 1

	if s:is_plugged('vim-lsp-settings')
		let g:lsp_settings = {
					\ 'intelephense': {
						\ 'workspace_config': {
							\ 'intelephense': {
								\ 'stubs': [
									\ 'aerospike',
									\ 'amqp',
									\ 'apache',
									\ 'apcu',
									\ 'ast',
									\ 'bcmath',
									\ 'blackfire',
									\ 'bz2',
									\ 'calendar',
									\ 'cassandra',
									\ 'com_dotnet',
									\ 'Core',
									\ 'couchbase',
									\ 'couchbase_v3',
									\ 'crypto',
									\ 'ctype',
									\ 'cubrid',
									\ 'curl',
									\ 'date',
									\ 'dba',
									\ 'decimal',
									\ 'dio',
									\ 'dom',
									\ 'ds',
									\ 'enchant',
									\ 'Ev',
									\ 'event',
									\ 'exif',
									\ 'fann',
									\ 'FFI',
									\ 'ffmpeg',
									\ 'fileinfo',
									\ 'filter',
									\ 'fpm',
									\ 'ftp',
									\ 'gd',
									\ 'gearman',
									\ 'geoip',
									\ 'geos',
									\ 'gettext',
									\ 'gmagick',
									\ 'gmp',
									\ 'gnupg',
									\ 'grpc',
									\ 'hash',
									\ 'http',
									\ 'ibm_db2',
									\ 'iconv',
									\ 'igbinary',
									\ 'imagick',
									\ 'imap',
									\ 'inotify',
									\ 'interbase',
									\ 'intl',
									\ 'json',
									\ 'judy',
									\ 'ldap',
									\ 'leveldb',
									\ 'libevent',
									\ 'libsodium',
									\ 'libvirt-php',
									\ 'libxml',
									\ 'lua',
									\ 'LuaSandbox',
									\ 'lzf',
									\ 'mailparse',
									\ 'mapscript',
									\ 'mbstring',
									\ 'mcrypt',
									\ 'memcache',
									\ 'memcached',
									\ 'meminfo',
									\ 'meta',
									\ 'ming',
									\ 'mongo',
									\ 'mongodb',
									\ 'mosquitto-php',
									\ 'mqseries',
									\ 'msgpack',
									\ 'mssql',
									\ 'mysql',
									\ 'mysql_xdevapi',
									\ 'mysqli',
									\ 'ncurses',
									\ 'newrelic',
									\ 'oauth',
									\ 'oci8',
									\ 'odbc',
									\ 'openssl',
									\ 'parallel',
									\ 'Parle',
									\ 'pcntl',
									\ 'pcov',
									\ 'pcre',
									\ 'pdflib',
									\ 'PDO',
									\ 'pdo_ibm',
									\ 'pdo_mysql',
									\ 'pdo_pgsql',
									\ 'pdo_sqlite',
									\ 'pgsql',
									\ 'Phar',
									\ 'phpdbg',
									\ 'posix',
									\ 'pspell',
									\ 'pthreads',
									\ 'radius',
									\ 'rar',
									\ 'rdkafka',
									\ 'readline',
									\ 'recode',
									\ 'redis',
									\ 'Reflection',
									\ 'regex',
									\ 'rpminfo',
									\ 'rrd',
									\ 'SaxonC',
									\ 'session',
									\ 'shmop',
									\ 'SimpleXML',
									\ 'snmp',
									\ 'soap',
									\ 'sockets',
									\ 'sodium',
									\ 'solr',
									\ 'SPL',
									\ 'SplType',
									\ 'SQLite',
									\ 'sqlite3',
									\ 'sqlsrv',
									\ 'ssh2',
									\ 'standard',
									\ 'stats',
									\ 'stomp',
									\ 'suhosin',
									\ 'superglobals',
									\ 'svm',
									\ 'svn',
									\ 'sybase',
									\ 'sync',
									\ 'sysvmsg',
									\ 'sysvsem',
									\ 'sysvshm',
									\ 'tidy',
									\ 'tokenizer',
									\ 'uopz',
									\ 'uuid',
									\ 'uv',
									\ 'v8js',
									\ 'wddx',
									\ 'win32service',
									\ 'winbinder',
									\ 'wincache',
									\ 'wordpress',
									\ 'xcache',
									\ 'xdebug',
									\ 'xhprof',
									\ 'xlswriter',
									\ 'xml',
									\ 'xmlreader',
									\ 'xmlrpc',
									\ 'xmlwriter',
									\ 'xsl',
									\ 'xxtea',
									\ 'yaf',
									\ 'yaml',
									\ 'yar',
									\ 'zend',
									\ 'Zend OPcache',
									\ 'ZendCache',
									\ 'ZendDebugger',
									\ 'ZendUtils',
									\ 'zip',
									\ 'zlib',
									\ 'zmq',
									\ 'zookeeper',
									\ 'zstd'
									\ ],
									\ },
									\ },
									\ },
									\ }
	endif
endif

" If vim-auto-save is installed.
if s:is_plugged('vim-auto-save')
	let g:auto_save = 1
	
	augroup vimrc_plugins_auto_save
		autocmd!
		autocmd FileType none let b:auto_save = 0
		autocmd FileType diff let b:auto_save = 0
		autocmd FileType gitcommit let b:auto_save = 0
	augroup END
endif
