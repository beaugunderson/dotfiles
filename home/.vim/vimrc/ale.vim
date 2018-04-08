let g:ale_linters = {
\  'javascript': ['eslint'],
\  'javascript.jsx': ['eslint', 'flow'],
\  'jsx': ['eslint', 'flow'],
\}

let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'javascript.jsx': ['eslint'],
\  'jsx': ['eslint'],
\}

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_options = '--fallback --local-only --pkg-conf'
let g:ale_python_mypy_options = '--ignore-missing-imports --follow-imports=skip'
let g:ale_virtualenv_dir_names = []

nmap <leader>f <Plug>(ale_fix)
