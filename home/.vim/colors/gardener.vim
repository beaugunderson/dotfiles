set background=dark
hi clear
syntax reset

let g:colors_name = "gardener"
let colors_name = "gardener"

" GUI Colors
hi Boolean          guibg=bg          guifg=#ff55ff    gui=bold
hi Character        guibg=bg          guifg=#ffffcc    gui=bold
hi Comment          guibg=bg          guifg=#888888    gui=none
hi Conditional      guibg=bg          guifg=#aadd55    gui=bold
hi Constant         guibg=bg          guifg=white      gui=bold
hi Cursor           guibg=#cc4455     guifg=white      gui=bold
hi Debug            guibg=bg          guifg=#ff9999    gui=none
hi Define           guibg=bg          guifg=#66ccdd    gui=bold
hi Delimiter        guibg=bg          guifg=fg         gui=bold
hi DiffAdd          guibg=#446688     guifg=fg         gui=none
hi DiffChange       guibg=#558855     guifg=fg         gui=none
hi DiffDelete       guibg=#884444     guifg=fg         gui=none
hi DiffText         guibg=#884444     guifg=fg         gui=bold
hi Directory        guibg=bg          guifg=#337700    gui=none
hi Error            guibg=#ff0000     guifg=white      gui=bold
hi ErrorMsg         guibg=bg          guifg=#ff0000    gui=bold
hi Exception        guibg=bg          guifg=#66ffcc    gui=bold
hi Float            guibg=bg          guifg=#bbddff    gui=bold
hi Function         guibg=bg          guifg=#ffffaa    gui=bold
hi Identifier       guibg=bg          guifg=#ffddaa    gui=none
hi Ignore           guibg=bg          guifg=#cccccc    gui=italic
hi IncSearch        guibg=#0066cc     guifg=white      gui=none
hi Include          guibg=bg          guifg=#99cc99    gui=bold
hi Keyword          guibg=bg          guifg=#66ffcc    gui=bold
hi Label            guibg=bg          guifg=#ffccff    gui=bold
hi ModeMsg          guibg=bg          guifg=#ffeecc    gui=none
hi NonText          guibg=#445566     guifg=#ffeecc    gui=bold
hi Normal           guibg=black       guifg=white      gui=none
hi Number           guibg=bg          guifg=#bbddff    gui=bold
hi Operator         guibg=bg          guifg=#cc9966    gui=bold
hi PreProc          guibg=bg          guifg=#ffcc99    gui=bold
hi Question         guibg=bg          guifg=#ccffcc    gui=bold
hi Repeat           guibg=bg          guifg=#ff9900    gui=bold
hi Special          guibg=bg          guifg=#bbddff    gui=bold
hi SpecialChar      guibg=bg          guifg=#bbddff    gui=bold
hi SpecialComment   guibg=#334455     guifg=#dddddd    gui=italic
hi SpecialKey       guibg=bg          guifg=fg         gui=none
hi Statement        guibg=bg          guifg=#ffffcc    gui=bold
hi StatusLine       guibg=#cc4455     guifg=white      gui=bold
hi StatusLineNC     guibg=#ffeecc     guifg=black      gui=none
hi StorageClass     guibg=bg          guifg=#99cc99    gui=bold
hi String           guibg=bg          guifg=#ffffcc    gui=none
hi Structure        guibg=bg          guifg=#99ff99    gui=bold
hi Tag              guibg=bg          guifg=#bbddff    gui=bold
hi Title            guibg=#445566     guifg=white      gui=bold
hi Titled           guibg=bg          guifg=fg         gui=none
hi Todo             guibg=#556677     guifg=#ff0000    gui=bold
hi Type             guibg=bg          guifg=#ccffaa    gui=bold
hi Typedef          guibg=bg          guifg=#99cc99    gui=italic
hi Underlined       guibg=bg          guifg=#99ccff    gui=underline
hi VertSplit        guibg=black       guifg=#ffeecc    gui=none
hi Visual           guibg=#557799     guifg=white      gui=none
hi htmlH1           guibg=bg          guifg=#ffffff    gui=bold
hi htmlH2           guibg=bg          guifg=#dadada    gui=bold
hi htmlH3           guibg=bg          guifg=#c6c6c6    gui=bold
hi htmlH4           guibg=bg          guifg=#b2b2b2    gui=bold
hi htmlH5           guibg=bg          guifg=#9e9e9e    gui=bold
hi htmlH6           guibg=bg          guifg=#8a8a8a    gui=bold
hi linenr           guibg=#262626     guifg=#808080    gui=bold

hi link             CursorIM          Cursor
hi link             Macro             Include
hi link             MoreMsg           ModeMsg
hi link             PreCondit         Include
hi link             Search            IncSearch
hi link             WarningMsg        ErrorMsg

" Terminal colors
hi Boolean          cterm=none        ctermfg=207      ctermbg=none
hi Character        cterm=bold        ctermfg=230      ctermbg=none
hi Comment          cterm=none        ctermfg=240      ctermbg=none
hi Conditional      cterm=bold        ctermfg=149      ctermbg=none
hi Constant         cterm=bold        ctermfg=255      ctermbg=none
hi Cursor           cterm=bold        ctermfg=255      ctermbg=167
hi CursorIM         cterm=bold        ctermfg=255      ctermbg=167
hi Debug            cterm=none        ctermfg=210      ctermbg=none
hi Define           cterm=bold        ctermfg=68       ctermbg=none
hi Delimiter        cterm=bold        ctermfg=255      ctermbg=none
hi DiffAdd          cterm=none        ctermfg=10       ctermbg=none
hi DiffChange       cterm=none        ctermfg=255      ctermbg=235
hi DiffDelete       cterm=none        ctermfg=9        ctermbg=none
hi DiffText         cterm=bold        ctermfg=255      ctermbg=2
hi Directory        cterm=none        ctermfg=64       ctermbg=none
hi Error            cterm=none        ctermfg=255      ctermbg=196
hi ErrorMsg         cterm=bold        ctermfg=196      ctermbg=none
hi Exception        cterm=bold        ctermfg=86       ctermbg=none
hi Float            cterm=bold        ctermfg=153      ctermbg=none
hi FoldColumn       cterm=none        ctermfg=0        ctermbg=240
hi Folded           cterm=none        ctermfg=0        ctermbg=240
hi Function         cterm=bold        ctermfg=229      ctermbg=none
hi Identifier       cterm=none        ctermfg=223      ctermbg=none
hi Ignore           cterm=none        ctermfg=251      ctermbg=none
hi IncSearch        cterm=none        ctermfg=255      ctermbg=25
hi Include          cterm=bold        ctermfg=114      ctermbg=none
hi Keyword          cterm=bold        ctermfg=86       ctermbg=none
hi Label            cterm=bold        ctermfg=225      ctermbg=none
hi Linear           cterm=none        ctermfg=248      ctermbg=none
hi Macro            cterm=bold        ctermfg=114      ctermbg=none
hi MatchParen       cterm=none        ctermfg=0        ctermbg=208
hi ModeMsg          cterm=none        ctermfg=230      ctermbg=none
hi MoreMsg          cterm=none        ctermfg=230      ctermbg=none
hi NonText          cterm=none        ctermfg=230      ctermbg=60
hi Normal           cterm=none        ctermfg=255      ctermbg=233
hi Number           cterm=bold        ctermfg=153      ctermbg=none
hi Operator         cterm=bold        ctermfg=173      ctermbg=none
hi OverLength       cterm=none        ctermfg=1        ctermbg=0
hi Pmenu            cterm=none        ctermfg=0        ctermbg=3
hi PmenuSel         cterm=none        ctermfg=0        ctermbg=7
hi PreCondit        cterm=bold        ctermfg=114      ctermbg=none
hi PreProc          cterm=bold        ctermfg=222      ctermbg=none
hi Question         cterm=none        ctermfg=194      ctermbg=none
hi Repeat           cterm=bold        ctermfg=208      ctermbg=none
hi Search           cterm=none        ctermfg=255      ctermbg=25
hi Special          cterm=bold        ctermfg=153      ctermbg=none
hi SpecialChar      cterm=bold        ctermfg=153      ctermbg=none
hi SpecialComment   cterm=bold        ctermfg=253      ctermbg=24
hi SpellBad         cterm=none        ctermfg=0        ctermbg=1
hi Statement        cterm=bold        ctermfg=230      ctermbg=none
hi StatusLine       cterm=bold        ctermfg=255      ctermbg=167
hi StatusLineNC     cterm=none        ctermfg=16       ctermbg=229
hi StorageClass     cterm=bold        ctermfg=78       ctermbg=none
hi String           cterm=none        ctermfg=230      ctermbg=none
hi Structure        cterm=bold        ctermfg=114      ctermbg=none
hi Tag              cterm=bold        ctermfg=153      ctermbg=none
hi Title            cterm=bold        ctermfg=255      ctermbg=60
hi Type             cterm=bold        ctermfg=193      ctermbg=none
hi Typedef          cterm=bold        ctermfg=114      ctermbg=none
hi VertSplit        cterm=none        ctermfg=0        ctermbg=229
hi Visual           cterm=none        ctermfg=255      ctermbg=68
hi WarningMsg       cterm=bold        ctermfg=196      ctermbg=none
hi htmlH1           cterm=bold        ctermfg=255      ctermbg=none
hi htmlH2           cterm=bold        ctermfg=253      ctermbg=none
hi htmlH3           cterm=bold        ctermfg=251      ctermbg=none
hi htmlH4           cterm=bold        ctermfg=249      ctermbg=none
hi htmlH5           cterm=bold        ctermfg=247      ctermbg=none
hi htmlH6           cterm=bold        ctermfg=245      ctermbg=none
hi linenr           cterm=bold        ctermfg=244      ctermbg=235
