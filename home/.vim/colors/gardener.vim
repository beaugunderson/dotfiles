set background=dark
highlight clear
syntax reset

let g:colors_name = 'gardener'

" so $VIMRUNTIME/syntax/hitest.vim

" GUI Colors
highlight Boolean          guibg=bg          guifg=#ff55ff    gui=bold
highlight Character        guibg=bg          guifg=#ffffcc    gui=bold
highlight ColorColumn      guibg=#1c1c1c     guifg=none       gui=none
highlight Comment          guibg=bg          guifg=#888888    gui=none
highlight Conditional      guibg=bg          guifg=#aadd55    gui=bold
highlight Constant         guibg=bg          guifg=#ffffff    gui=bold
highlight Cursor           guibg=#cc4455     guifg=#ffffff    gui=bold
highlight Debug            guibg=bg          guifg=#ff9999    gui=none
highlight Define           guibg=bg          guifg=#66ccdd    gui=bold
highlight Delimiter        guibg=bg          guifg=fg         gui=bold
highlight DiffAdd          guibg=#446688     guifg=fg         gui=none
highlight DiffChange       guibg=#558855     guifg=fg         gui=none
highlight DiffDelete       guibg=#884444     guifg=fg         gui=none
highlight DiffText         guibg=#884444     guifg=fg         gui=bold
highlight Directory        guibg=bg          guifg=#337700    gui=none
highlight Error            guibg=#ff0000     guifg=#ffffff    gui=bold  guisp=undercurl
highlight ErrorMsg         guibg=bg          guifg=#ff0000    gui=bold
highlight Exception        guibg=bg          guifg=#66ffcc    gui=bold
highlight Float            guibg=bg          guifg=#bbddff    gui=bold
highlight Function         guibg=bg          guifg=#ffffaa    gui=bold
highlight Identifier       guibg=bg          guifg=#ffddaa    gui=none
highlight Ignore           guibg=bg          guifg=#cccccc    gui=italic
highlight IncSearch        guibg=#0066cc     guifg=#ffffff    gui=none
highlight Include          guibg=bg          guifg=#99cc99    gui=bold
highlight Keyword          guibg=bg          guifg=#66ffcc    gui=bold
highlight Label            guibg=bg          guifg=#ffccff    gui=bold
highlight ModeMsg          guibg=bg          guifg=#ffeecc    gui=none
highlight NonText          guibg=#445566     guifg=#ffeecc    gui=bold
highlight Normal           guibg=#000000     guifg=#ffffff    gui=none
highlight Number           guibg=bg          guifg=#bbddff    gui=bold
highlight Operator         guibg=bg          guifg=#cc9966    gui=bold
highlight PreProc          guibg=bg          guifg=#ffcc99    gui=bold
highlight Question         guibg=bg          guifg=#ccffcc    gui=bold
highlight Repeat           guibg=bg          guifg=#ff9900    gui=bold
highlight Special          guibg=bg          guifg=#bbddff    gui=bold
highlight SpecialChar      guibg=bg          guifg=#bbddff    gui=bold
highlight SpecialComment   guibg=#334455     guifg=#dddddd    gui=italic
highlight SpecialKey       guibg=bg          guifg=fg         gui=none
highlight Statement        guibg=bg          guifg=#ffffcc    gui=bold
highlight StatusLine       guibg=#cc4455     guifg=#ffffff    gui=bold
highlight StatusLineNC     guibg=#ffeecc     guifg=#000000    gui=none
highlight StorageClass     guibg=bg          guifg=#99cc99    gui=bold
highlight String           guibg=bg          guifg=#ffffcc    gui=none
highlight Structure        guibg=bg          guifg=#99ff99    gui=bold
highlight Tag              guibg=bg          guifg=#bbddff    gui=bold
highlight Title            guibg=#445566     guifg=#ffffff    gui=bold
highlight Titled           guibg=bg          guifg=fg         gui=none
highlight Todo             guibg=#556677     guifg=#ff0000    gui=bold
highlight Type             guibg=bg          guifg=#ccffaa    gui=bold
highlight Typedef          guibg=bg          guifg=#99cc99    gui=italic
highlight Underlined       guibg=bg          guifg=#99ccff    gui=underline
highlight VertSplit        guibg=#ffeecc     guifg=#ffeecc    gui=none
highlight Visual           guibg=#557799     guifg=#ffffff    gui=none
highlight htmlH1           guibg=bg          guifg=#ffffff    gui=bold
highlight htmlH2           guibg=bg          guifg=#dadada    gui=bold
highlight htmlH3           guibg=bg          guifg=#c6c6c6    gui=bold
highlight htmlH4           guibg=bg          guifg=#b2b2b2    gui=bold
highlight htmlH5           guibg=bg          guifg=#9e9e9e    gui=bold
highlight htmlH6           guibg=bg          guifg=#8a8a8a    gui=bold
highlight linenr           guibg=#262626     guifg=#808080    gui=bold

highlight link             CursorIM              Cursor
highlight link             Macro                 Include
highlight link             MoreMsg               ModeMsg
highlight link             PreCondit             Include
highlight link             Search                IncSearch
highlight link             WarningMsg            ErrorMsg
highlight link             javaScriptDotNotation Function
