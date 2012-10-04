" Vim indent file
" Language:		html
" Release Coordinator:	Mike Lewis <mikelikespie@gmail.com>

runtime indent/javascript.vim
unlet! b:did_indent

sou $VIMRUNTIME/indent/html.vim

let b:html_indentexpr = &l:indentexpr

setlocal indentexpr=GetMyHTMLIndent()

function! GetMyHTMLIndent(...)
  if synIDattr(synID(v:lnum,1,1),'name') ==? 'javaScript'
    return GetJsIndent()
  else
    exe "let ind = ".b:html_indentexpr

    return ind
  endif
endfunction
