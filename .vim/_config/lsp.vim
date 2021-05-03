UsePlugin 'vim-lsp'

let g:lsp_fold_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_document_highlight_enabled = 0

nnoremap <leader>lf :<c-u>LspDocumentFormatSync<cr>

UsePlugin 'vim-lsp-settings'

let g:lsp_settings = {
\	'intelephense': {
\		'allowlist': ['php'],
\		'workspace_config': {
\			'intelephense': {
\				'stubs': [
\					"aerospike",
\					"amqp",
\					"apache",
\					"apcu",
\					"ast",
\					"bcmath",
\					"blackfire",
\					"bz2",
\					"calendar",
\					"cassandra",
\					"com_dotnet",
\					"Core",
\					"couchbase",
\					"couchbase_v3",
\					"crypto",
\					"ctype",
\					"cubrid",
\					"curl",
\					"date",
\					"dba",
\					"decimal",
\					"dio",
\					"dom",
\					"ds",
\					"enchant",
\					"Ev",
\					"event",
\					"exif",
\					"fann",
\					"FFI",
\					"ffmpeg",
\					"fileinfo",
\					"filter",
\					"fpm",
\					"ftp",
\					"gd",
\					"gearman",
\					"geoip",
\					"geos",
\					"gettext",
\					"gmagick",
\					"gmp",
\					"gnupg",
\					"grpc",
\					"hash",
\					"http",
\					"ibm_db2",
\					"iconv",
\					"igbinary",
\					"imagick",
\					"imap",
\					"inotify",
\					"interbase",
\					"intl",
\					"json",
\					"judy",
\					"ldap",
\					"leveldb",
\					"libevent",
\					"libsodium",
\					"libvirt-php",
\					"libxml",
\					"lua",
\					"LuaSandbox",
\					"lzf",
\					"mailparse",
\					"mapscript",
\					"mbstring",
\					"mcrypt",
\					"memcache",
\					"memcached",
\					"meminfo",
\					"meta",
\					"ming",
\					"mongo",
\					"mongodb",
\					"mosquitto-php",
\					"mqseries",
\					"msgpack",
\					"mssql",
\					"mysql",
\					"mysql_xdevapi",
\					"mysqli",
\					"ncurses",
\					"newrelic",
\					"oauth",
\					"oci8",
\					"odbc",
\					"openssl",
\					"parallel",
\					"Parle",
\					"pcntl",
\					"pcov",
\					"pcre",
\					"pdflib",
\					"PDO",
\					"pdo_ibm",
\					"pdo_mysql",
\					"pdo_pgsql",
\					"pdo_sqlite",
\					"pgsql",
\					"Phar",
\					"phpdbg",
\					"posix",
\					"pspell",
\					"pthreads",
\					"radius",
\					"rar",
\					"rdkafka",
\					"readline",
\					"recode",
\					"redis",
\					"Reflection",
\					"regex",
\					"rpminfo",
\					"rrd",
\					"SaxonC",
\					"session",
\					"shmop",
\					"SimpleXML",
\					"snmp",
\					"soap",
\					"sockets",
\					"sodium",
\					"solr",
\					"SPL",
\					"SplType",
\					"SQLite",
\					"sqlite3",
\					"sqlsrv",
\					"ssh2",
\					"standard",
\					"stats",
\					"stomp",
\					"suhosin",
\					"superglobals",
\					"svm",
\					"svn",
\					"sybase",
\					"sync",
\					"sysvmsg",
\					"sysvsem",
\					"sysvshm",
\					"tidy",
\					"tokenizer",
\					"uopz",
\					"uuid",
\					"uv",
\					"v8js",
\					"wddx",
\					"win32service",
\					"winbinder",
\					"wincache",
\					"wordpress",
\					"xcache",
\					"xdebug",
\					"xhprof",
\					"xlswriter",
\					"xml",
\					"xmlreader",
\					"xmlrpc",
\					"xmlwriter",
\					"xsl",
\					"xxtea",
\					"yaf",
\					"yaml",
\					"yar",
\					"zend",
\					"Zend OPcache",
\					"ZendCache",
\					"ZendDebugger",
\					"ZendUtils",
\					"zip",
\					"zlib",
\					"zmq",
\					"zookeeper",
\					"zstd",
\				]
\			}
\		}
\	}
\}
