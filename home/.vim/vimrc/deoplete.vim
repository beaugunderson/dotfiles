let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_at_startup = 1

function! s:close_popup_and_complete()
  return pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"
endfunction

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>close_popup_and_complete()<CR>

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
