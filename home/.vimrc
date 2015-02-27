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

" Don't enable folding by default, zc will enable though
set nofoldenable

" XXX
set textwidth=79

" Wrapping
set wrap
"set linebreak " Doesn't work with list option
let &showbreak="↪ "

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

nnoremap <leader>o :Unite -start-insert outline<cr>
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <leader>/ :Unite -start-insert grep:.<cr>

" XXX: Opens as kind 'common', needs to be 'file'
"nnoremap <space>p :Unite output:VimProcBang\ projects\ glob<cr>

" Hardcode python since we use virtualenvs
if has("mac")
  let g:ycm_path_to_python_interpreter = "/usr/local/bin/python"
elseif has("unix")
  let g:ycm_path_to_python_interpreter = "/usr/bin/python"
end

" Disable most of vim-jedi's features, what we really want is the arguments
" overlay
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

let g:jedi#goto_assignments_command = "<leader>pa"
let g:jedi#goto_definitions_command = "<leader>pd"
let g:jedi#documentation_command = "<leader>pk"
let g:jedi#usages_command = "<leader>pu"
let g:jedi#rename_command = "<leader>pr"

let g:SuperTabDefaultCompletionType = "<C-n>"

" Soon
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>

" Fix highlighting for git signs
highlight clear SignColumn

if has("autocmd")
  " Edit in place for crontab on OS X
  autocmd FileType crontab setlocal nowritebackup

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
  autocmd BufNewFile,BufReadPost .jscsrc setl filetype=json

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

let g:syntastic_javascript_eslint_args = '--rulesdir ~/.eslint'
let g:syntastic_python_pylint_args = '--rcfile=~/.pylintrc'

let g:syntastic_always_populate_loc_list = 1

let g:syntastic_auto_loc_list = 2

" Make decisions persistent
let g:localvimrc_persistent = 1

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

" I don't really use the title and it contributes to iTerm2 slowness
set notitle

if exists("&breakindent")
  set breakindent
endif

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

" <leader>space toggles search highlights
noremap <leader><space> :set hlsearch! hlsearch?<CR>

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
