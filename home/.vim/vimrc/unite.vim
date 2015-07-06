" Unite commands
let g:unite_source_history_yank_enable=1 " Keep track of history

" Fuzzy matching by default
" call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <C-p> :Unite -start-insert file_mru file_rec/async<cr>

nnoremap <leader>o :Unite -start-insert outline<cr>
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <leader>/ :Unite -start-insert grep:.<cr>

" XXX: Opens as kind 'common', needs to be 'file'
"nnoremap <space>p :Unite output:VimProcBang\ projects\ glob<cr>
