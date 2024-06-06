scriptencoding utf8

set t_Co=256

" Map leader to comma
let g:mapleader = ','

if has('nvim')
  set emoji
  set inccommand=split
  set termguicolors
endif

if has('nvim')
  lua require('config')
endif

" https://github.com/neovim/neovim/issues/9912
" TODO: "It's now ~/.local/state/nvim"
if has('nvim')
  let &viminfofile = expand('~/.local/share/nvim/shada/main.shada')
endif

if has('nvim')
  set exrc

  set diffopt+=hiddenoff
  set diffopt+=internal,algorithm:patience
  set diffopt+=iwhiteall
  set diffopt+=linematch:50
endif

if has('nvim')
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
endif

" search when using gf
set suffixesadd=.md,.js,.jsx,.ts,.tsx

let g:markdown_enable_conceal = 1
let g:markdown_enable_insert_mode_mappings = 1
let g:markdown_enable_mappings = 1
let g:markdown_enable_spell_checking = 0

set updatetime=300

vmap <unique> <s-left> <plug>SchleppLeft
vmap <unique> <s-right> <plug>SchleppRight
vmap <unique> <s-up> <plug>SchleppUp
vmap <unique> <s-down> <plug>SchleppDown
vmap <unique> D <plug>SchleppDup

let g:Schlepp#dupTrimWS = 1

set background=dark

if has('nvim')
  colorscheme evening-dark
endif

set spellfile=~/.vim/spell/words.utf8.add
" Don't check for sentence capitalization
set spellcapcheck=
set spelllang=en_us

" Don't enable folding by default, zc will enable though
set nofoldenable

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

" Move through display lines, not numbered lines
nnoremap k gk
nnoremap j gj

nnoremap <Up> gk
nnoremap <Down> gj

" TODO: add 'a' and remove 'c' for markdown and plain text files
set formatoptions=croqnl " add nl

" Soon
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>

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

" Add support for comment toggling in Terraform files
autocmd vimrc FileType terraform set commentstring=#\ %s

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
autocmd vimrc BufNewFile,BufReadPost *.tsx setlocal filetype=typescriptreact

set fillchars=vert:\  " So we don't get a trailing space error

let g:localvimrc_event = ['BufReadPre']

" Make decisions persistent
let g:localvimrc_persistent = 1

if has('persistent_undo')
  set undofile

  if has('nvim')
    set undodir=~/.vim/.undo//
  else
    set undodir=~/.vim/.undo-old//
  endif
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

" specified by nvim-cmp
set completeopt=menu,menuone,noselect

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
nnoremap <C-p> :Files<CR>
map <C-g> :GFiles<CR>

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" cq instaed of ci'
onoremap q i'
onoremap Q i"

" Make Y behave like C and D
nnoremap Y y$

" let semicolon do colon commands
nnoremap ; :

call matchadd('Todo', '\vTODO(_\w+)*', 0)
call matchadd('Todo', '\vHACK(_\w+)*', 0)

highlight OverLength cterm=none ctermfg=1

call matchadd('OverLength', '\%>80v.\+', 0)

set cinoptions=(0,W1s,m1

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

" center result after searching
noremap <plug>(slash-after) zz
