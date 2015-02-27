let python_highlight_all = 1

if getline(1) =~ '^#!.*python3$'
  " TODO: Set this based on hashbang or some other metric
  let g:syntastic_python_python_exec = '/usr/local/bin/python3'
  let g:syntastic_python_pylint_exe = '/usr/local/bin/python3 /usr/local/bin/pylint'
  let g:syntastic_python_flake8_exe = '/usr/local/bin/python3 /usr/local/bin/flake8'
endif

setl expandtab
setl tabstop=4
setl shiftwidth=4
setl suffixesadd+=.py

setl tags+=$HOME/.vim/tags/python.ctags

setl omnifunc=pythoncomplete#Complete

setl makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
setl efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

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

python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL

map <C-h> :py EvaluateCurrentRange()
endif
