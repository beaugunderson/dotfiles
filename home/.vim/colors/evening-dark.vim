" Succulent
" Scheme: by Beau Gunderson

" so $VIMRUNTIME/syntax/hitest.vim

" d=dark h=highlight n=normal

" GUI color definitions
let s:d1 = '2a2734' " #2a2734
let s:d2 = '363342' " #363342
let s:d3 = '545167' " #545167
let s:d4 = '6c6783' " #6c6783
let s:d5 = '787391' " #787391
let s:w1 = '7c756e' " #7c756e
let s:h1 = 'ffcc99' " #ffcc99
let s:h2 = 'ffb870' " #ffb870
let s:h3 = 'ffad5c' " #ffad5c
let s:h4 = 'e09142' " #e09142
let s:n1 = 'eeebff' " #eeebff
let s:n2 = 'c4b9fe' " #c4b9fe
let s:n3 = '9a86fd' " #9a86fd
let s:n4 = '8a75f5' " #8a75f5
let s:n5 = '7a63ee' " #7a63ee
let s:n6 = '6a51e6' " #6a51e6

" Theme setup
hi clear
syntax reset
let g:colors_name = 'succulent'

" Highlighting function
fun <sid>hi(group, guifg, guibg, attr)
  if a:guifg !=? ''
    exec 'hi ' . a:group . ' guifg=#' . a:guifg
  endif

  if a:guibg !=? ''
    exec 'hi ' . a:group . ' guibg=#' . a:guibg
  endif

  if a:attr !=? ''
    exec 'hi ' . a:group . ' gui=' . a:attr
  endif
endfun

" Vim editor colors                         fg       bg       attr
call <sid>hi('Bold',                        '',      '',      'bold')
call <sid>hi('Debug',                       s:n6,    '',      '')
call <sid>hi('Directory',                   s:h2,    '',      '')
call <sid>hi('ErrorMsg',                    s:n6,    s:d1,    '')
call <sid>hi('Exception',                   s:n6,    '',      '')
call <sid>hi('FoldColumn',                  '',      s:d2,    '')
call <sid>hi('Folded',                      s:d4,    s:d2,    '')
call <sid>hi('IncSearch',                   s:d2,    s:h4,    'none')
call <sid>hi('Italic',                      '',      '',      'italic')
call <sid>hi('Macro',                       s:n6,    '',      '')
call <sid>hi('MatchParen',                  s:d1,    s:d4,    '')
call <sid>hi('ModeMsg',                     s:w1,    '',      '')
call <sid>hi('MoreMsg',                     s:w1,    '',      '')
call <sid>hi('Question',                    s:h2,    '',      '')
call <sid>hi('Search',                      s:d4,    s:h3,    '')
call <sid>hi('TooLong',                     s:n6,    '',      '')
call <sid>hi('Underlined',                  s:n6,    '',      'underline')
call <sid>hi('Visual',                      '',      s:d3,    '')
call <sid>hi('VisualNOS',                   s:n6,    '',      '')
call <sid>hi('WarningMsg',                  s:n6,    '',      '')
call <sid>hi('WildMenu',                    s:n6,    '',      '')
call <sid>hi('Title',                       s:h2,    '',      'none')
call <sid>hi('Conceal',                     s:h2,    s:d1,    '')
call <sid>hi('Cursor',                      s:d1,    s:h4,    '')
call <sid>hi('NonText',                     s:d4,    '',      '')
call <sid>hi('Normal',                      s:n2,    s:d1,    '')
call <sid>hi('LineNr',                      s:d3,    s:d1,    '')
call <sid>hi('SignColumn',                  s:d4,    s:d1,    '')
call <sid>hi('SpecialKey',                  s:d4,    '',      '')
call <sid>hi('StatusLine',                  s:d5,    s:d3,    'none')
call <sid>hi('StatusLineNC',                s:d4,    s:d2,    'none')
call <sid>hi('VertSplit',                   s:d2,    s:d2,    'none')
call <sid>hi('WinSeparator',                s:d2,    s:d2,    'none')
" need another dark background hue for this
call <sid>hi('ColorColumn',                 '',      s:d2,    'none')
call <sid>hi('CursorColumn',                '',      s:d2,    'none')
call <sid>hi('CursorLine',                  '',      s:d2,    'none')
call <sid>hi('CursorLineNr',                s:d3,    s:d2,    '')
call <sid>hi('PMenu',                       s:d5,    s:d2,    'none')
call <sid>hi('PMenuSel',                    s:d2,    s:d5,    '')
call <sid>hi('TabLine',                     s:d4,    s:d2,    'none')
call <sid>hi('TabLineFill',                 s:d4,    s:d2,    'none')
call <sid>hi('TabLineSel',                  s:w1,    s:d2,    'none')
call <sid>hi('EndOfBuffer',                 '',      s:d3,    'none')

" Standard syntax highlighting
call <sid>hi('Boolean',                     s:h4,    '',      '')
call <sid>hi('Character',                   s:n6,    '',      '')
call <sid>hi('Comment',                     s:d4,    '',      '')
call <sid>hi('Conditional',                 s:n4,    '',      '')
call <sid>hi('Constant',                    s:h1,    '',      '')
call <sid>hi('Define',                      s:n4,    '',      'none')
call <sid>hi('Delimiter',                   s:n5,    '',      '')
call <sid>hi('Float',                       s:h4,    '',      '')
call <sid>hi('Function',                    s:h1,    '',      '')
call <sid>hi('Identifier',                  s:n1,    '',      'none')
call <sid>hi('Include',                     s:h2,    '',      '')
call <sid>hi('Keyword',                     s:n4,    '',      '')
call <sid>hi('Label',                       s:h3,    '',      '')
" Used in lots of vim-javascript highlighting groups e.g. jsModuleComma
"call <sid>hi('Noise',                       s:d4,    '',      '')
call <sid>hi('Number',                      s:h1,    '',      '')
call <sid>hi('Operator',                    s:h3,    '',      'none')
call <sid>hi('PreProc',                     s:h3,    '',      '')
call <sid>hi('Repeat',                      s:h3,    '',      '')
call <sid>hi('Special',                     s:n3,    '',      '')
call <sid>hi('SpecialChar',                 s:n5,    '',      '')
call <sid>hi('Statement',                   s:n1,    '',      'none')
call <sid>hi('StorageClass',                s:n3,    '',      '')
call <sid>hi('String',                      s:h1,    '',      '')
call <sid>hi('Structure',                   s:n4,    '',      '')
call <sid>hi('Tag',                         s:h3,    '',      '')
call <sid>hi('Todo',                        s:h3,    s:d2,    'italic')
call <sid>hi('Type',                        s:n2,    '',      'none')
call <sid>hi('Typedef',                     s:h3,    '',      '')

" C highlighting
"call <sid>hi('cOperator',                   s:h1,    '',      '')
"call <sid>hi('cPreCondit',                  s:n4,    '',      '')

" C# highlighting
"call <sid>hi('csClass',                     s:h3,    '',      '')
"call <sid>hi('csAttribute',                 s:h3,    '',      '')
"call <sid>hi('csModifier',                  s:n4,    '',      '')
"call <sid>hi('csType',                      s:n6,    '',      '')
"call <sid>hi('csUnspecifiedStatement',      s:h2,    '',      '')
"call <sid>hi('csContextualStatement',       s:n4,    '',      '')
"call <sid>hi('csNewDecleration',            s:n6,    '',      '')

" CSS highlighting
"call <sid>hi('cssBraces',                   s:d4,    '',      '')
"call <sid>hi('cssClassName',                s:n1,    '',      '')
"call <sid>hi('cssClassNameDot',             s:d5,    '',      '')
"call <sid>hi('cssInclude',                  s:d5,    '',      '')
"call <sid>hi('cssColor',                    s:h1,    '',      '')
"call <sid>hi('cssUnitDecorators',           s:h4,    '',      '')
"call <sid>hi('cssMediaKeyword',             s:h4,    '',      '')
"call <sid>hi('cssImportant',                s:n6,    '',      '')

" Diff highlighting
call <sid>hi('DiffAdd',                     s:w1, s:d2, '')
call <sid>hi('DiffChange',                  s:d4, s:d2, '')
call <sid>hi('DiffDelete',                  s:n6, s:d2, '')
call <sid>hi('DiffText',                    s:h2, s:d2, '')
call <sid>hi('DiffAdded',                   s:w1, s:d1, '')
call <sid>hi('DiffFile',                    s:n6, s:d1, '')
call <sid>hi('DiffNewFile',                 s:w1, s:d1, '')
call <sid>hi('DiffLine',                    s:h2, s:d1, '')
call <sid>hi('DiffRemoved',                 s:n6, s:d1, '')

" Git highlighting
"call <sid>hi('gitCommitOverflow',           s:n6, '',      '')
"call <sid>hi('gitCommitSummary',            s:w1, '',      '')

" HTML highlighting
"call <sid>hi('htmlBold',                    s:h3, '',      '')
"call <sid>hi('htmlItalic',                  s:n4, '',      '')
"call <sid>hi('htmlEndTag',                  s:d5, '',      '')
"call <sid>hi('htmlTag',                     s:d5, '',      '')
"call <sid>hi('htmlTagN',                    s:n1, '',      '')

" vim-javascript
"call <sid>hi('jsArrowFunction',             s:n1, '',      '')
"call <sid>hi('jsFlowClassGroup',            s:n2, '',      '')
"call <sid>hi('jsFlowClassProperty',         s:h3, '',      '')
"call <sid>hi('jsFlowObject',                s:h3, '',      '')
"call <sid>hi('jsFlowTypeStatement',         s:n4, '',      '')
"call <sid>hi('jsFuncParens',                s:d4, '',      '')
"call <sid>hi('jsModuleBraces',              s:d4, '',      '')
"call <sid>hi('jsParens',                    s:d4, '',      '')
"call <sid>hi('jsString',                    s:n1, '',      '')

" Markdown highlighting
"call <sid>hi('markdownCode',                s:w1, '',      '')
"call <sid>hi('markdownError',               s:n3, s:d1, '')
"call <sid>hi('markdownCodeBlock',           s:w1, '',      '')
"call <sid>hi('markdownHeadingDelimiter',    s:h2, '',      '')

" Python highlighting
"call <sid>hi('pythonDot',                   s:d5, '',      '')
"call <sid>hi('pythonOperator',              s:n4, '',      '')
"call <sid>hi('pythonRepeat',                s:n4, '',      '')

call <sid>hi('BracelessIndent',             s:n4, s:d3, '')

" SASS highlighting
"call <sid>hi('sassidChar',                  s:n6, '',      '')
"call <sid>hi('sassClassChar',               s:h4, '',      '')
"call <sid>hi('sassInclude',                 s:n1, '',      '')
"call <sid>hi('scssInclude',                 s:n1, '',      '')
"call <sid>hi('sassMixing',                  s:n4, '',      '')
"call <sid>hi('sassMixinName',               s:h4, '',      '')
"call <sid>hi('scssMixinName',               s:h4, '',      '')
"call <sid>hi('scssVariable',                s:n2, '',      '')
"call <sid>hi('scssSelectorChar',            s:d5, '',      '')
"call <sid>hi('cssIncludeKeyword',           s:n1, '',      '')
"call <sid>hi('scssMixinParams',             s:d4, '',      '')
"call <sid>hi('scssFunctionName',            s:n3, '',      '')

" Spelling highlighting
call <sid>hi('SpellBad',                    '',      s:d1, 'undercurl')
call <sid>hi('SpellLocal',                  '',      s:d1, 'undercurl')
call <sid>hi('SpellCap',                    '',      s:d1, 'undercurl')
call <sid>hi('SpellRare',                   '',      s:d1, 'undercurl')

" TreeSitter
call <sid>hi('@tag',                        s:n2, '',   '')
call <sid>hi('@tag.attribute',              s:n2, '',   '')
call <sid>hi('@tag.delimiter',              s:h1, '',   '')
call <sid>hi('@type',                       s:h4, '',   '')
call <sid>hi('@variable',                   s:h4, '',   '')

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:d1 s:d2 s:d3 s:d4  s:d5  s:n3  s:n2  s:n1  s:n6  s:h4 s:h3  s:w1  s:h1  s:h2  s:n4  s:n5
