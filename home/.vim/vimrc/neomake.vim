" let g:neomake_open_list = 2

autocmd! BufWritePost,BufEnter * Neomake

augroup Neomake
  autocmd!
  autocmd QuitPre * let g:neomake_verbose = 0
augroup END

let g:neomake_javascript_enabled_makers = ['eslint_d', 'jscs']

let g:neomake_python_enabled_makers = ['flake8', 'pylint', 'pydocstyle']

" let g:neomake_warning_sign = {
"   \ 'text': 'W',
"   \ 'texthl': 'WarningMsg',
"   \ }
" let g:neomake_error_sign = {
"   \ 'text': 'E',
"   \ 'texthl': 'ErrorMsg',
"   \ }

" let g:neomake_javascript_jscs_maker = {
"   \ 'exe': 'jscs',
"   \ 'args': ['--no-color', '--preset', 'airbnb', '--reporter', 'inline', '--esnext'],
"   \ 'errorformat': '%f: line %l\, col %c\, %m',
"   \ }
