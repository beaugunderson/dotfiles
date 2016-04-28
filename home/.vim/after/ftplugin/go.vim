scriptencoding utf8

setl noexpandtab
setl tabstop=2
setl shiftwidth=2

setl listchars=tab:\ \ ,trail:·,nbsp:␣

" go stuff, move to own file
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = 'goimports'

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
