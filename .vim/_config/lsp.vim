UsePlugin 'vim-lsp'

let g:lsp_fold_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_document_highlight_enabled = 0

UsePlugin 'vim-lsp-settings'

let g:lsp_settings = {
\	'intelephense': {
\		'allowlist': ['php'],
\		'workspace_config': {
\			'intelephense': {
\				'stubs': ['wordpress']
\			}
\		}
\	}
\}
