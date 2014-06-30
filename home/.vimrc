call pathogen#infect()

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

set background=dark

colorscheme gardener

set spellfile=~/.vim/spell/words.utf8.add
set spellcapcheck=
set spelllang=en_us

" XXX
set textwidth=79

" Wrapping
set wrap
"set linebreak " Doesn't work with list option

" Map leader to comma
let mapleader=","

" Move through display lines, not numbered lines
nnoremap k gk
nnoremap j gj

nnoremap <Up> gk
nnoremap <Down> gj

if version >= 7300
  set formatoptions=croqanlj " add anlj
else
  set formatoptions=croqanl " add anl
endif

" Add sudow for writing to read-only files
cnoremap sudow w !sudo tee % >/dev/null

" Unite commands
let g:unite_source_history_yank_enable=1 " Keep track of history

" Fuzzy matching by default
call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <C-p> :Unite -start-insert file_mru file_rec/async<cr>
nnoremap <space>o :Unite -start-insert outline<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>/ :Unite -start-insert grep:.<cr>

" XXX: Opens as kind 'common', needs to be 'file'
nnoremap <space>p :Unite output:VimProcBang\ projects\ glob<cr>

" Make YouCompleteMe play nice with Tern
let g:ycm_cache_omnifunc = 0

" Tern
let g:tern_show_argument_hints="on_hold"

nnoremap <leader>tr :TernRename<cr>
nnoremap <leader>tt :TernType<cr>
nnoremap <leader>td :TernDef<cr>

" Soon
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>

" Fix highlighting for git signs
highlight clear SignColumn

" Fix slow exit from insert mode
if ! has("gui_running")
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

   au BufNewFile,BufReadPost *.ejs setl filetype=jst
   au BufNewFile,BufReadPost .eslintrc setl filetype=json
endif

set fillchars=vert:\ 

" Syntastic options
let g:syntastic_javascript_checkers = ['eslint', 'jscs']

let g:syntastic_python_checkers = ['pylint', 'flake8']

let g:syntastic_mode_map = {'mode': 'active',
  \ 'passive_filetypes': ['cpp']}

let g:syntastic_always_populate_loc_list = 1

let g:syntastic_auto_loc_list = 2

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
  \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

if has("persistent_undo")
  set undofile
  set undodir=~/.vimundo
endif

set nocompatible

set list listchars=tab:→\ ,trail:·,nbsp:␣

set ignorecase
set smartcase

set magic

set modelines=0

set t_Co=256
set term=xterm-256color

" Hide the default mode text
set noshowmode
set showtabline=2

set completeopt=menu,preview,longest

set mouse=a
set mousehide
set ttymouse=xterm2

set browsedir=buffer
set wildignore=*.o,*.obj,*.bak,*.exe,*.jpg,*.gif,*.png,.git,.svn

set title

if exists("&colorcolumn")
  set colorcolumn=+1
endif

set tabstop=2
set shiftwidth=2
set backspace=eol,start,indent
set complete=.,w,b,u,U,t,i,d
set number

set hl=l:Visual
set hlsearch
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

call matchadd('OverLength', '\%>80v.\+', 0)

" Syntax-specific
let c_space_errors = 1
