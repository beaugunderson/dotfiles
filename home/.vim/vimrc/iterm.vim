" set clipboard=unnamed

if exists('$ITERM_PROFILE')
  " autocmd VimEnter * set ttymouse=sgr
  " autocmd FocusGained * set ttymouse=sgr
  " autocmd BufEnter * set ttymouse=sgr

  " Into and out of termcap mode; not sure what this does
  " let &t_ti = &t_ti . "\e[?2004h"
  " let &t_te = "\e[?2004l" . &t_te

  " For pasting
  " function XTermPasteBegin(ret)
  "   set pastetoggle=<Esc>[201~
  "   set paste
  "   return a:ret
  " endfunction

  " map <expr> <Esc>[200~ XTermPasteBegin("i")
  " imap <expr> <Esc>[200~ XTermPasteBegin("")
  " vmap <expr> <Esc>[200~ XTermPasteBegin("c")

  " cmap <Esc>[200~ <nop>
  " cmap <Esc>[201~ <nop>

  " Different cursors for insert mode and the other modes
  " let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  " let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
