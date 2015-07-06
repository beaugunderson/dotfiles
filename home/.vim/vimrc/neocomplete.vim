augroup ns
  autocmd!
augroup END

autocmd ns FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd ns FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd ns FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd ns FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd ns FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#buffer#cache_limit_size = 50000
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#enable_auto_close_preview = 1

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
