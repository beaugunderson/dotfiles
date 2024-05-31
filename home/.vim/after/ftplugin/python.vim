let g:python_highlight_all = 1

" turn off vim's awful indentation
" filetype indent off

" let g:braceless_generate_scripts = 1

" turn on braceless' better indentation
" BracelessEnable +indent +highlight-cc2

setl expandtab
setl tabstop=4
setl shiftwidth=4
setl suffixesadd+=.py

setl tags+=$HOME/.vim/tags/python.ctags

setl omnifunc=pythoncomplete#Complete

setl errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>

if has('python')
  python << EOF
import os
import sys
import vim

for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
endif
