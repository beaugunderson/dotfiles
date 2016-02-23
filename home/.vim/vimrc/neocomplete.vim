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

if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif

let g:neocomplete#sources#omni#functions.javascript = [
  \ 'jspc#omni',
  \ 'tern#Complete',
  \]

function! s:close_popup_and_complete()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>close_popup_and_complete()<CR>

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
