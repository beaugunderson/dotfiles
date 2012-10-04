let python_highlight_all = 1

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
