call pathogen#infect()

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

if has("mac")
  set rtp+=/usr/local/Cellar/fzf/0.8.7
elseif has("unix")
  set rtp+=~/.fzf
endif

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
let &showbreak='↪ '

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

" Hardcode python since we use virtualenvs
if has("mac")
  let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
elseif has("unix")
  let g:ycm_path_to_python_interpreter = '/usr/bin/python'
end

let g:SuperTabDefaultCompletionType = '<C-n>'

" Soon
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>

" Fix highlighting for git signs
highlight clear SignColumn

if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \    exe "normal g'\"" |
        \ endif

  " Fix slow exit from insert mode
  if ! has("gui_running")
    set ttimeoutlen=10

    augroup FastEscape
      autocmd!
      autocmd InsertEnter * set timeoutlen=0
      autocmd InsertLeave * set timeoutlen=1000
    augroup END
  endif

  autocmd BufNewFile,BufReadPost .eslintrc setl filetype=json
  autocmd BufNewFile,BufReadPost *.ejs setl filetype=jst
endif

set fillchars=vert:\ 

" Syntastic options
let g:syntastic_aggregate_errors = 1

" Check on open
let g:syntastic_check_on_open = 1

" Don't check on close
let g:syntastic_check_on_wq = 0

" Custom symbols
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

let g:syntastic_style_error_symbol = "S✗"
let g:syntastic_style_warning_symbol = "S⚠"

" Shorter loc list
let g:syntastic_loc_list_height = 5

" Jump if there's an error (but not a warning)
let g:syntastic_auto_jump = 2

let g:syntastic_javascript_checkers = ['eslint', 'jscs']
let g:syntastic_python_checkers = ['pylint', 'flake8']

let g:syntastic_always_populate_loc_list = 1

let g:syntastic_auto_loc_list = 2

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

" Hide the default mode text
set noshowmode
set showtabline=2

set completeopt=menu,preview,longest

set mouse=a
set mousehide

if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

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

" Disables paste mode when leaving insert mode
autocmd InsertLeave *
    \ if &paste == 1 |
    \     set nopaste |
    \ endif

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
