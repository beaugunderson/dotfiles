scriptencoding utf8

call plug#begin('~/.vim/plugged')

" Plug 'h1mesuke/unite-outline'
" Plug 'rizzatti/dash.vim'
" Plug 'Shougo/neomru'
" Plug 'Shougo/unite'

Plug 'airblade/vim-gitgutter'
Plug 'beaugunderson/vim-scss-instead'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'bogado/file-line'
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'embear/vim-localvimrc'
Plug 'GutenYe/json5.vim', {'for': 'json'}
Plug 'hdima/python-syntax', {'for': 'python'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'junegunn/vim-emoji'
Plug 'kchmck/vim-coffee-script', {'for': 'coffeescript'}
Plug 'marijnh/tern_for_vim', {'do': 'npm install', 'for': 'javascript'}
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'rhysd/npm-debug-log.vim'
Plug 'scrooloose/syntastic'
Plug 'syngan/vim-vimlint', {'for': 'vim'}

if !has('nvim')
  Plug 'Shougo/neocomplete.vim'
endif

Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'todesking/vint-syntastic', {'for': 'vim'}
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

if has('nvim')
  Plug 'Valloric/YouCompleteMe', {'do': './install.sh'}
endif

Plug 'wakatime/vim-wakatime'
Plug 'wincent/terminus'
Plug 'ynkdir/vim-vimlparser', {'for': 'vim'}

call plug#end()

source ~/.vim/vimrc/jedi.vim

if !has('nvim')
  source ~/.vim/vimrc/neocomplete.vim
endif

source ~/.vim/vimrc/syntastic.vim
" source ~/.vim/vimrc/unite.vim

let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'

let g:tern_show_signature_in_pum = 1

if has('mac')
  set runtimepath+=/usr/local/opt/fzf
elseif has('unix')
  set runtimepath+=~/.fzf
endif

set background=dark

colorscheme gardener

set spellfile=~/.vim/spell/words.utf8.add
" Don't check for sentence capitalization
set spellcapcheck=
set spelllang=en_us

" Don't enable folding by default, zc will enable though
set nofoldenable

" XXX
set textwidth=79

" Wrapping
set wrap

set list
set listchars=tab:→\ ,trail:·,nbsp:␣

" Break at a sensible place instead of at any character
set linebreak

let &g:showbreak = '↪ '

if exists('&breakindent')
  set breakindent
  set breakindentopt=shift:-2
endif

" Map leader to comma
let g:mapleader = ','

" Move through display lines, not numbered lines
nnoremap k gk
nnoremap j gj

nnoremap <Up> gk
nnoremap <Down> gj

" TODO: add 'a' and remove 'c' for markdown and plain text files
set formatoptions=croqnl " add nl

" Add sudow for writing to read-only files
cnoremap sudow w !sudo tee % >/dev/null

" Soon
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>

" Fix highlighting for git signs
highlight clear SignColumn

augroup vimrc
  autocmd!
augroup END

" Disables paste mode when leaving insert mode
autocmd vimrc InsertLeave *
  \ if &paste == 1 |
  \   set nopaste |
  \ endif

" Kill the silly tern previews
autocmd vimrc BufEnter * set completeopt-=preview

" Edit in place for crontab on OS X
autocmd vimrc FileType crontab setlocal nowritebackup

" When editing a file, always jump to the last cursor position
autocmd vimrc BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line('$') |
  \   exe "normal g'\"" |
  \ endif

" Add support for comment toggling in git commits
autocmd vimrc FileType gitcommit set commentstring=#\ %s

" Fix slow exit from insert mode
if !has('gui_running')
  set ttimeoutlen=10

  augroup FastEscape
    autocmd!
    autocmd InsertEnter * set timeoutlen=0
    autocmd InsertLeave * set timeoutlen=1000
  augroup END
endif

autocmd vimrc BufNewFile,BufReadPost requirements.txt setlocal filetype=conf

autocmd vimrc BufNewFile,BufReadPost .eslintrc setlocal filetype=json
autocmd vimrc BufNewFile,BufReadPost .jscsrc setlocal filetype=json

autocmd vimrc BufNewFile,BufReadPost *.ejs setlocal filetype=jst

set fillchars=vert:\  " So we don't get a trailing space error

" Make decisions persistent
let g:localvimrc_persistent = 1

if has('persistent_undo')
  set undofile
  set undodir=~/.vimundo
endif

set directory=~/tmp//

set ignorecase
set smartcase

set magic

set modelines=0

" Hide the default mode text
set noshowmode
set showtabline=2

set completeopt=menu,preview,longest

" XXX: Broken with iTerm2 nightly? Displays the output in the command line.
set t_RV=

set browsedir=buffer
set wildignore=*.o,*.obj,*.bak,*.exe,*.jpg,*.gif,*.png,*.pyc,.git,.svn

" I don't really use the title and it contributes to iTerm2 slowness
set notitle

if exists('&colorcolumn')
  set colorcolumn=+1
endif

set tabstop=2
set shiftwidth=2
set backspace=eol,start,indent
set complete=.,w,b,u,U,t,i,d
set number

set highlight=l:Visual
set hlsearch
set showmatch

" <leader>space toggles search highlights
noremap <leader><space> :set hlsearch! hlsearch?<CR>

" <leader>r redraws the screen
noremap <leader>r :redraw!<CR>

" Toggle comments with the space key
nmap <space> gcc
vmap <space> gc

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

" Commonly-typed command alternatives
command! -bang W :w
command! -bang Wq :wq
command! -bang WQ :wq
command! -bang Q :q

" <Leader>j join without gap
nnoremap <expr> <Leader>j ':<C-U><BS>'
  \. repeat('Ji <Esc>"_diw', v:count<=2 ? 1 : v:count-1)

" [count]<Leader>j and {Visual}<Leader>j
xnoremap <script> <Leader>j <Esc><SID>(NoGapJoin)

nnoremap <expr> <SID>(NoGapJoin) (line(".")>line("'<") ? "'<" : "")
  \. repeat('Ji <Esc>"_diw', max([line("'>")-line("'<"), 1]))

" Change :wrench: to 🔧
nnoremap <expr> <Leader>e ':%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>'

" Ctrl-c copies to clipboard
map <C-c> "+y

" Make Y behave like C and D
nnoremap Y y$

" What does this do?
inoremap <Nul> <C-x><C-o>

map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>

call matchadd('OverLength', '\%>80v.\+', 0)

" Syntax-specific
let g:c_space_errors=1
