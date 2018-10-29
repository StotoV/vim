" PHP specific settings
"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
" Mappings configuration
"""""""""""""""""""""""""""""""""""""
" PHP NAMESPACE INSERTER
    function! IPhpInsertUse()
        call PhpInsertUse()
        call feedkeys('a',  'n')
    endfunction
    inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
    noremap <Leader>u :call PhpInsertUse()<CR>
    let g:php_namespace_sort_after_insert = 1
" END PHP NAMESPACE INSERTER

" ALE
    let b:ale_linters = ['php']
    let b:ale_fixers = ['php_cs_fixer']
" END ALE
