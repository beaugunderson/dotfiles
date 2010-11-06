let python_highlight_all = 1

set expandtab
set tabstop=4
set shiftwidth=4
set suffixesadd+=.py

set tags+=$HOME/.vim/tags/python.ctags

map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>

autocmd Filetype python set omnifunc=pythoncomplete#Complete

autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

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
