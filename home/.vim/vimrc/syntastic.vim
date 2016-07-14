scriptencoding utf8

let g:syntastic_aggregate_errors = 1

" Don't check on close
let g:syntastic_check_on_wq = 0

" Custom symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

let g:syntastic_style_error_symbol = 'S✗'
let g:syntastic_style_warning_symbol = 'S⚠'

" Shorter loc list
let g:syntastic_loc_list_height = 5

" Jump if there's an error (but not a warning)
let g:syntastic_auto_jump = 3

let g:syntastic_javascript_checkers = ['eslint', 'jscs']
let g:syntastic_python_checkers = ['pylint', 'flake8', 'pep257']
let g:syntastic_vim_checkers = ['vimlint', 'vint']

" Use a tidy that supports HTML5
let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy'

" Ignore errors that happen because of Django things
" TODO: Only ignore these in htmldjango files?
let g:syntastic_html_tidy_ignore_errors = [
  \   'trimming empty <span>',
  \   'plain text isn''t allowed in <head> elements',
  \   'plain text isn''t allowed in <table> elements',
  \   '<a> escaping malformed URI reference',
  \   '<form> escaping malformed URI reference',
  \   '<img> escaping malformed URI reference',
  \   '<script> escaping malformed URI reference',
  \ ]

let g:syntastic_vimlint_options = {'EVL108': 1}

" Add tidy for htmldjango files
let g:syntastic_filetype_map = {'htmldjango': 'html'}

let g:syntastic_python_pylint_args = '--rcfile=~/.pylintrc'

let g:syntastic_always_populate_loc_list = 1

let g:syntastic_auto_loc_list = 2
