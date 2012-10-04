" A plugin that humanizes UNIX epoch dates.

" For example, 1332006094952 becomes:
"
"     3/17/12 10:41:34am (-193,308 seconds from now)

" Last Change:   3/19/2012
" Maintainer:    Beau Gunderson <beau@beaugunderson.com>
" License:       MIT

if (exists("g:loaded_human_dates") && g:loaded_human_dates) || &cp
   finish
endif

let g:loaded_human_dates = 1

" Print the human readable form of a long epoch date
function! s:dateFromLongEpoch()
   " Let the shell divide because Vim only supports 32 bit integers
   let sdate = system("echo $((". expand("<cword>") ."/1000))")

   " Format the date
   let human = tolower(substitute(strftime("%m/%d/%y %I:%M:%S%p", sdate), "\\\(^\\\|\\\s\\\)0", "\\1", "g"))

   echo human ." (". system("LC_ALL=en_US.utf8 printf \"%'d\" ". (sdate - localtime())) ." seconds from now)"
endfunc

command DateFromLongEpoch :call <SID>dateFromLongEpoch()

map <leader>j :DateFromLongEpoch<CR>
