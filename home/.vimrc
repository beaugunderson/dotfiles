scriptencoding utf8

set t_Co=256

" disable some things for speed
let g:loaded_vimballPlugin = 1
let g:loaded_rrhelper = 1
let g:did_install_default_menus = 1

call plug#begin('~/.vim/plugged')

" Plug 'h1mesuke/unite-outline'
" Plug 'rizzatti/dash.vim'
" Plug 'Shougo/neomru'
" Plug 'Shougo/unite'

" doesn't work with jedi-vim for some reason
" Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}

" JavaScript/HTML plugins
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'gavocanov/vim-js-indent', {'for': 'javascript'}
Plug 'GutenYe/json5.vim', {'for': 'json'}
Plug 'moll/vim-node'          " support 'gf' on require/import lines
Plug 'othree/html5.vim', {'for': 'html'}

" JSX plugins
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx', 'jsx']}
Plug 'mxw/vim-jsx', {'for': ['javascript.jsx', 'jsx']}

" Python plugins
" Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'tweekmonster/braceless.vim', {'for': 'python'}
Plug 'tweekmonster/django-plus.vim', {'for': 'python'}
Plug 'tweekmonster/impsort.vim', {'for': 'python'}
Plug 'vim-python/python-syntax', {'for': 'python'}
" Plug 'zchee/deoplete-jedi', {'for': 'python'}

" Other filetypes
Plug 'cakebaker/scss-syntax.vim'
Plug 'chrisbra/csv.vim', {'for': 'csv'}
" Plug 'dearrrfish/vim-applescript'
Plug 'ekalinin/Dockerfile.vim'
" Plug 'fatih/vim-go', {'for': 'go'}
" Plug 'keith/swift.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'lepture/vim-jinja'
" Plug 'pearofducks/ansible-vim'
Plug 'syngan/vim-vimlint', {'for': 'vim'}
" Plug 'tomlion/vim-solidity', {'for': 'solidity'}
Plug 'ynkdir/vim-vimlparser', {'for': 'vim'}

" Other plugins
" Plug 'ConradIrwin/vim-bracketed-paste' " not needed with terminus?
" Plug 'autozimu/LanguageClient-neovim', {
"   \ 'branch': 'next',
"   \ 'do': 'bash install.sh',
"   \ }
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" re-enable after neovim fixes startup hang
" Plug 'airblade/vim-gitgutter' " git +/- in the gutter
Plug 'ap/vim-css-color'       " colorize hex strings in files
" Plug 'dbeniamine/cheat.sh-vim' " programming questions/answers
Plug 'embear/vim-localvimrc'  " support .lvimrc files
Plug 'gerw/vim-HiLinkTrace'   " HLT/HLT! commands
Plug 'junegunn/goyo.vim'      " distraction-free writing
Plug 'junegunn/gv.vim'        " GV command for browsing git revisions
Plug 'junegunn/limelight.vim' " hyper-distraction-free writing
Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-slash'     " improve search
Plug 'Konfekt/FastFold'
Plug 'kopischke/vim-fetch'    " support `vim file.js:50`
" Plug 'mileszs/ack.vim'
Plug 'misterbuckley/vim-definitive' " go to definition
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Plug 'neomake/neomake'        " linting
Plug 'ryanoasis/vim-devicons'
" Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'todesking/vint-syntastic', {'for': 'vim'}
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'     " git support, e.g. GBlame
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'      " extends vim-fugitive for github
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'      " better file navigator
Plug 'tweekmonster/fzf-filemru'
Plug 'tweekmonster/startuptime.vim'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'               " asynchronous linting
Plug 'wakatime/vim-wakatime'  " log editing activity to wakatime.com
Plug 'wincent/terminus'       " iTerm niceties (focus, mouse)
Plug 'zirrostig/vim-schlepp'

call plug#end()

if has('nvim')
  set emoji
  set inccommand=split
  set termguicolors
endif

let g:markdown_enable_mappings = 0
let g:markdown_enable_spell_checking = 0

set updatetime=300

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" Show signature help while editing
autocmd CursorHoldI * silent! call CocActionAsync('showSignatureHelp')

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use <c-space> for trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <C-x><C-o> to complete 'word', 'emoji' and 'include' sources
" imap <silent> <C-x><C-o> <Plug>(coc-complete-custom)

" source ~/.vim/vimrc/jedi.vim

if has('nvim')
  source ~/.vim/vimrc/ale.vim
  " source ~/.vim/vimrc/deoplete.vim
  " source ~/.vim/vimrc/lsc.vim
endif

vmap <unique> <s-left> <plug>SchleppLeft
vmap <unique> <s-right> <plug>SchleppRight
vmap <unique> <s-up> <plug>SchleppUp
vmap <unique> <s-down> <plug>SchleppDown
vmap <unique> D <plug>SchleppDup

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:Schlepp#dupTrimWS = 1

" let g:ackprg = 'ag --vimgrep'

let g:airline_powerline_fonts = 1
let g:airline_theme = 'succulent'

let g:used_javascript_libs = 'jquery,underscore'

let g:javascript_plugin_flow = 1

set background=dark

colorscheme evening-dark

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

autocmd vimrc BufNewFile,BufReadPost *requirements.txt setlocal filetype=conf
autocmd vimrc BufNewFile,BufReadPost *requirements.in setlocal filetype=conf

autocmd vimrc BufNewFile,BufReadPost .eslintrc setlocal filetype=json

autocmd vimrc BufNewFile,BufReadPost *.osascript setlocal filetype=applescript

autocmd vimrc BufNewFile,BufReadPost *.ts setlocal filetype=typescript

autocmd vimrc User GoyoEnter Limelight
autocmd vimrc User GoyoLeave Limelight!

set fillchars=vert:\  " So we don't get a trailing space error

let g:localvimrc_event = ['BufReadPre']

" Make decisions persistent
let g:localvimrc_persistent = 1

if has('persistent_undo')
  set undofile
  set undodir=~/.vim/.undo//
endif

set backupdir=~/.vim/.backup//
set directory=~/.vim/.swap//

set backupcopy=yes

set ignorecase
set smartcase

set magic

set modelines=0

" Hide the default mode text
set noshowmode
set showtabline=2

set completeopt=menu,preview,longest,noinsert

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

set hlsearch
set showmatch

" <leader>space toggles search highlights
noremap <leader><space> :set hlsearch! hlsearch?<CR>

" <leader>r redraws the screen
noremap <leader>r :redraw!<CR>

" <leader>n goes to the next error
nmap <leader>n :lnext<CR>

" <leader>d goes to the definition
nnoremap <leader>d :FindDefinition<CR>

map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

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
command! -bang WQa :wqa
command! -bang Wqa :wqa
command! -bang Q :q<bang>
command! -bang QA :qa<bang>
command! -bang Qa :qa<bang>

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

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Ctrl-p opens fzf
" map <C-p> :Files<CR>
" map <C-p> :Files<CR>

nnoremap <C-p> :ProjectMru --tiebreak=end<cr>
map <C-g> :GFiles<CR>

map <leader>c :Files ~/p/canvas<CR>

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

map <leader>f :ALEFix<CR>

" cq instaed of ci'
onoremap q i'
onoremap Q i"

" Make Y behave like C and D
nnoremap Y y$

" let semicolon do colon commands
nnoremap ; :

call matchadd('Todo', '\vTODO(_\w+)*', 0)

highlight OverLength cterm=none ctermfg=1

call matchadd('OverLength', '\%>80v.\+', 0)

function HideHtml()
  syntax match Entity "&lt;" conceal cchar=<
  syntax match Entity "&gt;" conceal cchar=>
  syntax match Entity "&amp;" conceal cchar=&

  " XXX Entity
  syntax match Entity /\v[<][a-zA-Z 0-9"\/=:{}-]+[>]/ conceal

  set conceallevel=2
endfunction

set cinoptions=(0,W1s,m1

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

" center result after searching
noremap <plug>(slash-after) zz
