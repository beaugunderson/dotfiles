colorscheme gardener

syntax on

filetype plugin on
filetype indent on

set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>

function! <SID>SynStack()
  if !exists("*synstack")
    echo "No synstack support."

    return
  endif

  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set encoding=utf-8

"set list listchars=tab:··,trail:·

set modelines=0
set t_Co=256
set nocompatible

set ruler
set laststatus=2
set showtabline=2

set autoread
set wildmenu

set completeopt=menu,preview,longest

set mouse=a
set mousehide

set browsedir=buffer
set wildignore=*.o,*.obj,*.bak,*.exe

set smarttab autoindent
set tabstop=3
set shiftwidth=3
set backspace=eol,start,indent
set complete=.,w,b,u,U,t,i,d
set number

set hl=l:Visual
set hlsearch
set incsearch
set showmatch

inoremap <Nul> <C-x><C-o>

map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>

" Syntax-specific
"let html_indent_script1 = "inc"
"let html_indent_style1 = "inc"
"let html_indent_inctags = "html,body,head,tbody,li,p"

"let g:js_indent_log = 0

let c_space_errors = 1

let python_highlight_all = 1

" Python-specific:
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
