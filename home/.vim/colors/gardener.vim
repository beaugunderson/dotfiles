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
highlight Constant         guibg=bg          guifg=white      gui=bold
highlight Cursor           guibg=#cc4455     guifg=white      gui=bold
highlight Debug            guibg=bg          guifg=#ff9999    gui=none
highlight Define           guibg=bg          guifg=#66ccdd    gui=bold
highlight Delimiter        guibg=bg          guifg=fg         gui=bold
highlight DiffAdd          guibg=#446688     guifg=fg         gui=none
highlight DiffChange       guibg=#558855     guifg=fg         gui=none
highlight DiffDelete       guibg=#884444     guifg=fg         gui=none
highlight DiffText         guibg=#884444     guifg=fg         gui=bold
highlight Directory        guibg=bg          guifg=#337700    gui=none
highlight Error            guibg=#ff0000     guifg=white      gui=bold  guisp=undercurl
highlight ErrorMsg         guibg=bg          guifg=#ff0000    gui=bold
highlight Exception        guibg=bg          guifg=#66ffcc    gui=bold
highlight Float            guibg=bg          guifg=#bbddff    gui=bold
highlight Function         guibg=bg          guifg=#ffffaa    gui=bold
highlight Identifier       guibg=bg          guifg=#ffddaa    gui=none
highlight Ignore           guibg=bg          guifg=#cccccc    gui=italic
highlight IncSearch        guibg=#0066cc     guifg=white      gui=none
highlight Include          guibg=bg          guifg=#99cc99    gui=bold
highlight Keyword          guibg=bg          guifg=#66ffcc    gui=bold
highlight Label            guibg=bg          guifg=#ffccff    gui=bold
highlight ModeMsg          guibg=bg          guifg=#ffeecc    gui=none
highlight NonText          guibg=#445566     guifg=#ffeecc    gui=bold
highlight Normal           guibg=black       guifg=white      gui=none
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
highlight StatusLine       guibg=#cc4455     guifg=white      gui=bold
highlight StatusLineNC     guibg=#ffeecc     guifg=black      gui=none
highlight StorageClass     guibg=bg          guifg=#99cc99    gui=bold
highlight String           guibg=bg          guifg=#ffffcc    gui=none
highlight Structure        guibg=bg          guifg=#99ff99    gui=bold
highlight Tag              guibg=bg          guifg=#bbddff    gui=bold
highlight Title            guibg=#445566     guifg=white      gui=bold
highlight Titled           guibg=bg          guifg=fg         gui=none
highlight Todo             guibg=#556677     guifg=#ff0000    gui=bold
highlight Type             guibg=bg          guifg=#ccffaa    gui=bold
highlight Typedef          guibg=bg          guifg=#99cc99    gui=italic
highlight Underlined       guibg=bg          guifg=#99ccff    gui=underline
highlight VertSplit        guibg=black       guifg=#ffeecc    gui=none
highlight Visual           guibg=#557799     guifg=white      gui=none
highlight htmlH1           guibg=bg          guifg=#ffffff    gui=bold
highlight htmlH2           guibg=bg          guifg=#dadada    gui=bold
highlight htmlH3           guibg=bg          guifg=#c6c6c6    gui=bold
highlight htmlH4           guibg=bg          guifg=#b2b2b2    gui=bold
highlight htmlH5           guibg=bg          guifg=#9e9e9e    gui=bold
highlight htmlH6           guibg=bg          guifg=#8a8a8a    gui=bold
highlight linenr           guibg=#262626     guifg=#808080    gui=bold

highlight link             CursorIM          Cursor
highlight link             Macro             Include
highlight link             MoreMsg           ModeMsg
highlight link             PreCondit         Include
highlight link             Search            IncSearch
highlight link             WarningMsg        ErrorMsg

" Terminal colors
highlight Normal           cterm=none        ctermfg=255      ctermbg=233
highlight IncSearch        cterm=none        ctermfg=255      ctermbg=25
highlight Search           cterm=none        ctermfg=255      ctermbg=25
highlight OverLength       cterm=none        ctermfg=1
highlight Boolean          cterm=none        ctermfg=13       ctermbg=none
highlight Character        cterm=bold        ctermfg=230      ctermbg=none
highlight ColorColumn      cterm=none        ctermfg=none     ctermbg=234
highlight Comment          cterm=none        ctermfg=240      ctermbg=none
highlight Conditional      cterm=bold        ctermfg=149      ctermbg=none
highlight Constant         cterm=bold        ctermfg=255      ctermbg=none
highlight Cursor           cterm=bold        ctermfg=255      ctermbg=167
highlight CursorIM         cterm=bold        ctermfg=255      ctermbg=167
highlight Debug            cterm=none        ctermfg=210      ctermbg=none
highlight Define           cterm=bold        ctermfg=68       ctermbg=none
highlight Delimiter        cterm=bold        ctermfg=255      ctermbg=none
highlight DiffAdd          cterm=none        ctermfg=10       ctermbg=none
highlight DiffChange       cterm=none        ctermfg=255      ctermbg=235
highlight DiffDelete       cterm=none        ctermfg=9        ctermbg=none
highlight DiffText         cterm=bold        ctermfg=255      ctermbg=2
highlight Directory        cterm=none        ctermfg=64       ctermbg=none
highlight Error            cterm=none        ctermfg=255      ctermbg=196
highlight ErrorMsg         cterm=bold        ctermfg=196      ctermbg=none
highlight Exception        cterm=bold        ctermfg=86       ctermbg=none
highlight Float            cterm=bold        ctermfg=153      ctermbg=none
highlight FoldColumn       cterm=none        ctermfg=0        ctermbg=240
highlight Folded           cterm=none        ctermfg=0        ctermbg=240
highlight Function         cterm=bold        ctermfg=229      ctermbg=none
highlight Identifier       cterm=none        ctermfg=223      ctermbg=none
highlight Ignore           cterm=none        ctermfg=251      ctermbg=none
highlight Include          cterm=bold        ctermfg=114      ctermbg=none
highlight Keyword          cterm=bold        ctermfg=86       ctermbg=none
highlight Label            cterm=bold        ctermfg=225      ctermbg=none
highlight Linear           cterm=none        ctermfg=248      ctermbg=none
highlight Macro            cterm=bold        ctermfg=114      ctermbg=none
highlight MatchParen       cterm=none        ctermfg=0        ctermbg=208
highlight ModeMsg          cterm=none        ctermfg=230      ctermbg=none
highlight MoreMsg          cterm=none        ctermfg=230      ctermbg=none
highlight NonText          cterm=none        ctermfg=230      ctermbg=60
highlight Number           cterm=bold        ctermfg=153      ctermbg=none
highlight Operator         cterm=bold        ctermfg=173      ctermbg=none
" highlight Pmenu            cterm=none        ctermfg=0        ctermbg=3
" highlight PmenuSel         cterm=none        ctermfg=0        ctermbg=7
highlight PreCondit        cterm=bold        ctermfg=114      ctermbg=none
highlight PreProc          cterm=bold        ctermfg=222      ctermbg=none
highlight Question         cterm=none        ctermfg=194      ctermbg=none
highlight Repeat           cterm=bold        ctermfg=208      ctermbg=none
highlight Special          cterm=bold        ctermfg=153      ctermbg=none
highlight SpecialChar      cterm=bold        ctermfg=153      ctermbg=none
highlight SpecialComment   cterm=bold        ctermfg=253      ctermbg=24
highlight SpellBad         cterm=none        ctermfg=0        ctermbg=1
highlight Statement        cterm=bold        ctermfg=230      ctermbg=none
highlight StatusLine       cterm=bold        ctermfg=255      ctermbg=167
highlight StatusLineNC     cterm=none        ctermfg=16       ctermbg=229
highlight StorageClass     cterm=bold        ctermfg=78       ctermbg=none
highlight String           cterm=none        ctermfg=230      ctermbg=none
highlight Structure        cterm=bold        ctermfg=114      ctermbg=none
highlight Tag              cterm=bold        ctermfg=153      ctermbg=none
highlight Title            cterm=bold        ctermfg=255      ctermbg=none
highlight Type             cterm=bold        ctermfg=193      ctermbg=none
highlight Typedef          cterm=bold        ctermfg=114      ctermbg=none
highlight VertSplit        cterm=none        ctermfg=0        ctermbg=229
highlight Visual           cterm=none        ctermfg=255      ctermbg=68
highlight WarningMsg       cterm=bold        ctermfg=196      ctermbg=none
highlight htmlH1           cterm=bold        ctermfg=255      ctermbg=none
highlight htmlH2           cterm=bold        ctermfg=253      ctermbg=none
highlight htmlH3           cterm=bold        ctermfg=251      ctermbg=none
highlight htmlH4           cterm=bold        ctermfg=249      ctermbg=none
highlight htmlH5           cterm=bold        ctermfg=247      ctermbg=none
highlight htmlH6           cterm=bold        ctermfg=245      ctermbg=none
highlight linenr           cterm=bold        ctermfg=244      ctermbg=235

highlight link             javaScriptDotNotation Function
