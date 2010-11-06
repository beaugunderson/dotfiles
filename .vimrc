colorscheme gardener

syntax on

filetype plugin on
filetype indent on

set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif

  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set encoding=utf-8

set list listchars=tab:··,trail:·

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
