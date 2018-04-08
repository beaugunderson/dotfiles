" Disable most of vim-jedi's features, what we really want is the arguments
" overlay
let g:jedi#force_py_version = 3

let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = ''
let g:jedi#show_call_signatures = '1'

let g:jedi#goto_assignments_command = '<leader>pa'
let g:jedi#goto_definitions_command = '<leader>pd'
let g:jedi#documentation_command = '<leader>pk'
let g:jedi#usages_command = '<leader>pu'
let g:jedi#rename_command = '<leader>pr'
