call pathogen#infect()

set background=dark
colorscheme gardener

"colorscheme solarized

syntax on

filetype plugin on
filetype indent on

set spellfile=~/.vim/spell/words.utf8.add
set spellcapcheck=
set spelllang=en_us

" Map leader to comma
let mapleader = ","

" Fix highlighting
highlight Pmenu ctermfg=0 ctermbg=3
highlight PmenuSel ctermfg=0 ctermbg=7

if has("autocmd")
   " When editing a file, always jump to the last cursor position
   autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \    exe "normal g'\"" |
      \ endif
endif

let g:Powerline_symbols = 'fancy'

call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
call Pl#Theme#InsertSegment('currhigroup', 'after', 'virtualenv:statusline')

set undofile
set undodir=~/.vimundo

set encoding=utf-8

set list listchars=tab:··,trail:·,nbsp:␣

set ignorecase
set smartcase

set magic

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
set ttymouse=xterm2

set term=xterm-256color

set browsedir=buffer
set wildignore=*.o,*.obj,*.bak,*.exe,*.jpg,*.gif,*.png,.git,.svn

set title

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

" Command-T options
let g:CommandTMaxCachedDirectories=0
let g:CommandTMaxHeight=25

" Syntax-specific
let c_space_errors = 1
