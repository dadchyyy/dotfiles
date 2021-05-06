UsePlugin 'vim-php-cs-fixer'

let g:php_cs_fixer_enable_default_mapping = 0

nnoremap <silent> <leader>F :call PhpCsFixerFixFile()<cr>
