let $PAGER=''

set modelines=0
set t_Co=256
set nocompatible
set ruler

syntax on

filetype plugin on
filetype indent on

set autoread
set wildmenu

set completeopt=menu,preview,longest

let g:js_indent_log = 0

" Python-specific:
let python_highlight_all = 1

set suffixesadd+=.py

set tags+=$HOME/.vim/tags/python.ctags

python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>

autocmd Filetype python set omnifunc=pythoncomplete#Complete

autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

inoremap <Nul> <C-x><C-o>

map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>

python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <C-h> :py EvaluateCurrentRange()
" End Python-specific

colorscheme gardener

let html_indent_script1 = "inc"
let html_indent_style1 = "inc"
let html_indent_inctags = "html,body,head,tbody,li,p"

set mouse=a
set mousehide

set showtabline=2
set browsedir=buffer
set wildignore=*.o,*.obj,*.bak,*.exe

set smarttab autoindent
set tabstop=3
set shiftwidth=3
set backspace=eol,start,indent
set complete=.,w,b,u,U,t,i,d
set nu

set hl=l:Visual
set hlsearch
set incsearch
set showmatch

" F2 for paste mode
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O><F2>
set pastetoggle=<F2>
