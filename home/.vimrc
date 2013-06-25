call pathogen#infect()

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

set background=dark
colorscheme gardener

syntax on

filetype plugin on
filetype indent on

set spellfile=~/.vim/spell/words.utf8.add
set spellcapcheck=
set spelllang=en_us

" Wrapping
set wrap
"set linebreak " Doesn't work with list option

" Move through display lines, not numbered lines
nnoremap k gk
nnoremap j gj

nnoremap <Up> gk
nnoremap <Down> gj

set formatoptions=croqanlj " add anlj

" Soon
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>

" Fix highlighting for git signs
highlight clear SignColumn

" Map leader to comma
let mapleader=","

" Fix slow exit from insert mode
if ! has('gui_running')
    set ttimeoutlen=10

    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000

    augroup END
endif

if has("autocmd")
   " When editing a file, always jump to the last cursor position
   autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \    exe "normal g'\"" |
      \ endif

   au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

   au BufNewFile,BufReadPost *.ejs setl filetype=jst
endif

set fillchars=vert:\ 

let g:syntastic_javascript_checker='jshint'

let g:syntastic_mode_map = { 'mode': 'active',
  \ 'passive_filetypes': ['cpp'] }

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
  \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

if has("&undofile")
  set undofile
  set undodir=~/.vimundo
endif

set encoding=utf-8

set list listchars=tab:··,trail:·,nbsp:␣

set ignorecase
set smartcase

set magic

set modelines=0
set t_Co=256
set nocompatible

set ruler
" Always display the statusline in all windows
set laststatus=2
" Hide the default mode text
set noshowmode
set showtabline=2

set autoread
set wildmenu

set completeopt=menu,preview,longest

set mouse=a
set mousehide
set ttymouse=xterm2

set term=xterm-256color

set browsedir=buffer
set wildignore=*.o,*.obj,*.bak,*.exe,*.jpg,*.gif,*.png,.git,.svn

set title

set textwidth=80

if exists("&colorcolumn")
  set colorcolumn=+1
endif

set smarttab autoindent
set tabstop=2
set shiftwidth=2
set backspace=eol,start,indent
set complete=.,w,b,u,U,t,i,d
set number

set hl=l:Visual
set hlsearch
set incsearch
set showmatch

" Toggle pasting with F2
set pastetoggle=<F2>

" Space toggles search highlights
noremap <space> :set hlsearch! hlsearch?<CR>

" Keep search results centered in the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Perl regexes
nnoremap / /\v
vnoremap / /\v

" Ctrl-c copies to clipboard
map <C-c> "+y

" Make Y behave like C and D
nnoremap Y y$

" What does this do?
inoremap <Nul> <C-x><C-o>

map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>

autocmd WinEnter,BufRead * match OverLength /\%81v.\+/

" Command-T options
let g:CommandTMaxCachedDirectories=0
let g:CommandTMaxHeight=25

" Syntax-specific
let c_space_errors = 1
