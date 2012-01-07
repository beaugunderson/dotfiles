colorscheme gardener

syntax on

filetype plugin on
filetype indent on

set spellfile=~/words.utf8.add

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
function! <SID>SynStack()
   if !exists("*synstack")
      return
   endif

   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:Powerline_symbols = 'fancy'

set undofile
set undodir=~/.vimundo

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

function! EditScss()
   " The current file
   let file = expand("%")

   " The current file's basename plus .scss
   let scss = expand("%:r") . ".scss"

   " If the file exists
   if filereadable(scss)
      " Prompt the user and store the user's choice (1-indexed) in a variable
      let choice = confirm("Do you want to edit " . scss . " instead?", "&Yes\n&No", 1, "Question")

      " If the user picked [Y]es
      if choice == 1
         " Set file to the escaped scss filename
         let file = fnameescape(scss)
      endif
   endif

   " e[dit] the file
   exe "e" file

   " Execute the autocommands for the file
   exe "doautocmd BufReadPost" file
endfunction

" Execute EditScss() whenever a *.css file is read
:au BufReadCmd *.css call EditScss()

au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax

" Ctrl-c copies to clipboard
map <C-c> "+y

" Make Y behave like C and D
nnoremap Y y$

inoremap <Nul> <C-x><C-o>

map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>

" Syntax-specific
"let html_indent_script1 = "inc"
"let html_indent_style1 = "inc"
"let html_indent_inctags = "html,body,head,tbody,li,p"

"let g:js_indent_log = 0

let c_space_errors = 1
