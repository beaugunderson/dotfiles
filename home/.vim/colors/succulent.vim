" Succulent
" Scheme: by Beau Gunderson

set background=dark
highlight clear
syntax reset

let g:colors_name = 'succulent'

" so $VIMRUNTIME/syntax/hitest.vim

" d=dark h=highlight n=normal

" per-split background color; change based on file type
" :setlocal winhighlight=Normal:SpellError

" goals
" - organic look
" - living code growing out of soil surroundings

" GUI color definitions
" let s:d1 = '2a2734' " #2a2734
" let s:d2 = '363342' " #363342
" let s:d3 = '545167' " #545167
" let s:d4 = '6c6783' " #6c6783
" let s:d5 = '787391' " #787391

let s:d1 = '262732' " #262732
let s:d2 = '3b3b47' " #3b3b47
let s:d3 = '50505c' " #50505c
let s:d4 = '656571' " #656571
let s:d5 = '7b7a87' " #7b7a87

" let s:h1 = 'ffcc99' " #ffcc99
" let s:h2 = 'ffb870' " #ffb870
" let s:h3 = 'ffad5c' " #ffad5c
" let s:h4 = 'e09142' " #e09142

let s:h1 = 'f4e4f7'  " #f4e4f7
let s:h2 = 'd7c8da'  " #d7c8da
let s:h3 = 'bcaec0'  " #bcaec0
let s:h4 = 'a396a7'  " #a396a7

" let s:n1 = 'eeebff' " #eeebff
" let s:n2 = 'c4b9fe' " #c4b9fe
" let s:n3 = '9a86fd' " #9a86fd
" let s:n4 = '8a75f5' " #8a75f5
" let s:n5 = '7a63ee' " #7a63ee
" let s:n6 = '6a51e6' " #6a51e6

let s:n1 = 'f7ffff' " #f7ffff
let s:n2 = 'cde0e0' " #cde0e0
let s:n3 = 'a8baba' " #a8baba
let s:n4 = '869898' " #869898
let s:n5 = '677878' " #677878
let s:n6 = '495a5b' " #495a5b

let s:bd = '7b424a' " #7b424a
let s:bl = '93565e' " #93565e

let s:gd = '6c8466' " #6c8466
let s:gl = '829b7c' " #829b7c

" Highlighting function
fun <sid>hi(group, guifg, guibg, attr)
  if a:guifg !=? ''
    exec 'hi ' . a:group . ' guifg=#' . a:guifg
  endif

  if a:guibg !=? ''
    exec 'hi ' . a:group . ' guibg=#' . a:guibg
  endif

  if a:attr !=? ''
    if a:attr ==? 'undercurl'
      exec 'hi ' . a:group . ' guisp=' . a:attr
    else
      exec 'hi ' . a:group . ' gui=' . a:attr
    endif
  endif
endfun

" Text attributes                           fg    bg    attr
call <sid>hi('Bold',                        '',   '',   'bold')
call <sid>hi('Italic',                      '',   '',   'italic')
call <sid>hi('Underlined',                  s:n6, '',   'underline')

" Spelling
call <sid>hi('SpellBad',                    s:bl, '',   'undercurl')
call <sid>hi('SpellLocal',                  s:bl, '',   'undercurl')
call <sid>hi('SpellCap',                    s:bl, '',   'undercurl')
call <sid>hi('SpellRare',                   s:bl, '',   'undercurl')

" need another dark background hue for this
call <sid>hi('ColorColumn',                 '',   s:d2, 'none')
call <sid>hi('Conceal',                     s:h2, s:d1, '')
call <sid>hi('Cursor',                      s:d1, s:h4, '')
call <sid>hi('CursorColumn',                '',   s:d2, 'none')
call <sid>hi('CursorLine',                  '',   s:d2, 'none')
call <sid>hi('CursorLineNr',                s:d3, s:d2, '')
call <sid>hi('Debug',                       s:n6, '',   '')
call <sid>hi('Directory',                   s:h2, '',   '')
call <sid>hi('EndOfBuffer',                 '',   s:d3, 'none')
call <sid>hi('ErrorMsg',                    s:n6, s:d1, '')
call <sid>hi('Exception',                   s:n6, '',   '')
call <sid>hi('FoldColumn',                  '',   s:d2, '')
call <sid>hi('Folded',                      s:d4, s:d2,  '')
call <sid>hi('IncSearch',                   s:d2, s:h4, 'none')
call <sid>hi('LineNr',                      s:d3, s:d1, '')
call <sid>hi('Macro',                       s:n6, '',   '')
call <sid>hi('MatchParen',                  s:d1, s:d4,  '')
call <sid>hi('ModeMsg',                     s:d5, '',   '')
call <sid>hi('MoreMsg',                     s:d5, '',   '')
call <sid>hi('NonText',                     s:d4, '',   '')
call <sid>hi('Normal',                      s:n2, s:d1, '')
call <sid>hi('PMenu',                       s:d5, s:d2, 'none')
call <sid>hi('PMenuSel',                    s:d2, s:d5, '')
call <sid>hi('Question',                    s:h2, '',   '')
call <sid>hi('Search',                      s:d4, s:h3, '')
call <sid>hi('SignColumn',                  s:d4, s:d1, '')
call <sid>hi('SpecialKey',                  s:d4, '',   '')
" handled by airline?
" call <sid>hi('StatusLine',                  s:d5, s:d3, 'none')
" call <sid>hi('StatusLineNC',                s:d4, s:d2, 'none')
call <sid>hi('TabLine',                     s:d4, s:d2, 'none')
call <sid>hi('TabLineFill',                 s:d4, s:d2, 'none')
call <sid>hi('TabLineSel',                  s:d5, s:d2, 'none')
call <sid>hi('Title',                       s:h2, '',   'none')
" is this used?
" call <sid>hi('TooLong',                     s:n6, '',   '')
call <sid>hi('VertSplit',                   s:d2, s:d2, 'none')
call <sid>hi('Visual',                      '',   s:d3, '')
call <sid>hi('VisualNOS',                   s:n6, '',   '')
call <sid>hi('WarningMsg',                  s:n6, '',   '')
call <sid>hi('WildMenu',                    s:n6, '',   '')

" Standard syntax highlighting
call <sid>hi('Boolean',                     s:h4, '',   '')
call <sid>hi('Character',                   s:n6, '',   '')
call <sid>hi('Comment',                     s:d4, '',   '')
call <sid>hi('Conditional',                 s:n4, '',   '')
call <sid>hi('Constant',                    s:h1, '',   '')
call <sid>hi('Define',                      s:n4, '',   'none')
call <sid>hi('Delimiter',                   s:n5, '',   '')
call <sid>hi('Float',                       s:h4, '',   '')
call <sid>hi('Function',                    s:h1, '',   '')
call <sid>hi('Identifier',                  s:n1, '',   'none')
call <sid>hi('Include',                     s:h2, '',   '')
call <sid>hi('Keyword',                     s:n4, '',   '')
call <sid>hi('Label',                       s:h3, '',   '')
call <sid>hi('Number',                      s:h1, '',   '')
call <sid>hi('Operator',                    s:h3, '',   'none')
call <sid>hi('PreProc',                     s:h3, '',   '')
call <sid>hi('Repeat',                      s:h3, '',   '')
call <sid>hi('Special',                     s:n3, '',   '')
call <sid>hi('SpecialChar',                 s:n5, '',   '')
call <sid>hi('Statement',                   s:n1, '',   'none')
call <sid>hi('StorageClass',                s:n3, '',   '')
call <sid>hi('String',                      s:h1, '',   '')
call <sid>hi('Structure',                   s:n4, '',   '')
call <sid>hi('Tag',                         s:h3, '',   '')
call <sid>hi('Todo',                        s:bl, s:d2, 'italic')
call <sid>hi('Type',                        s:n2, '',   'none')
call <sid>hi('Typedef',                     s:h3, '',   '')

" C highlighting
call <sid>hi('cOperator',                   s:h1, '',   '')
call <sid>hi('cPreCondit',                  s:n4, '',   '')

" C# highlighting
call <sid>hi('csClass',                     s:h3, '',   '')
call <sid>hi('csAttribute',                 s:h3, '',   '')
call <sid>hi('csModifier',                  s:n4, '',   '')
call <sid>hi('csType',                      s:n6, '',   '')
call <sid>hi('csUnspecifiedStatement',      s:h2, '',   '')
call <sid>hi('csContextualStatement',       s:n4, '',   '')
call <sid>hi('csNewDecleration',            s:n6, '',   '')

" CSS highlighting
call <sid>hi('cssBraces',                   s:d4, '',   '')
call <sid>hi('cssClassName',                s:n1, '',   '')
call <sid>hi('cssClassNameDot',             s:d5, '',   '')
call <sid>hi('cssInclude',                  s:d5, '',   '')
call <sid>hi('cssColor',                    s:h1, '',   '')
call <sid>hi('cssUnitDecorators',           s:h4, '',   '')
call <sid>hi('cssMediaKeyword',             s:h4, '',   '')
call <sid>hi('cssImportant',                s:n6, '',   '')

" Diff highlighting
call <sid>hi('DiffAdd',                     s:d5, s:d2, '')
call <sid>hi('DiffChange',                  s:d4, s:d2, '')
call <sid>hi('DiffDelete',                  s:n6, s:d2, '')
call <sid>hi('DiffText',                    s:h2, s:d2, '')
call <sid>hi('DiffAdded',                   s:d5, s:d1, '')
call <sid>hi('DiffFile',                    s:n6, s:d1, '')
call <sid>hi('DiffNewFile',                 s:d5, s:d1, '')
call <sid>hi('DiffLine',                    s:h2, s:d1, '')
call <sid>hi('DiffRemoved',                 s:n6, s:d1, '')

" Git highlighting
call <sid>hi('gitCommitOverflow',           s:n6, '',   '')
call <sid>hi('gitCommitSummary',            s:d5, '',   '')

" GitGutter highlighting
call <sid>hi('GitGutterAdd',                s:gl, s:d1, '')
call <sid>hi('GitGutterChange',             s:h2, s:d1, '')
call <sid>hi('GitGutterDelete',             s:bl, s:d1, '')
call <sid>hi('GitGutterChangeDelete',       s:bl, s:d1, '')

" HTML highlighting
call <sid>hi('htmlBold',                    s:h3, '',   '')
call <sid>hi('htmlItalic',                  s:n4, '',   '')
call <sid>hi('htmlEndTag',                  s:d5, '',   '')
call <sid>hi('htmlTag',                     s:d5, '',   '')
call <sid>hi('htmlTagN',                    s:n1, '',   '')

" JavaScript highlighting
call <sid>hi('javaScript',                  s:n3, '',   '')
call <sid>hi('javaScriptBraces',            s:d4, '',   '')
call <sid>hi('javaScriptNumber',            s:h4, '',   '')
call <sid>hi('javaScriptParens',            s:d4, '',   '')
call <sid>hi('JavaScriptIdentifier',        s:h4, '',   '')
call <sid>hi('JavaScriptConditional',       s:h4, '',   '')
call <sid>hi('JavaScriptOpSymbols',         s:h4, '',   '')
call <sid>hi('JavaScriptOperator',          s:h4, '',   '')
call <sid>hi('JavaScriptStatement',         s:h4, '',   '')
call <sid>hi('JavaScriptExceptions',        s:h4, '',   '')
call <sid>hi('JavaScriptFuncArg',           s:n2, '',   '')
call <sid>hi('JavaScriptFuncComma',         s:d4, '',   '')
call <sid>hi('JavaScriptEndColons',         s:d4, '',   '')
call <sid>hi('JavaScriptIdentifier',        s:h1, '',   '')
call <sid>hi('JavaScriptDeprecated',        s:n2, '',   '')
call <sid>hi('JavaScriptFuncDef',           s:n1, '',   '')
call <sid>hi('JavaScriptFunctionKey',       s:n1, '',   '')
call <sid>hi('JavaScriptFuncExp',           s:n1, '',   '')
call <sid>hi('JavaScriptString',            s:n1, '',   '')
call <sid>hi('JavaScriptPrototype',         s:h1, '',   '')

" Markdown highlighting
call <sid>hi('markdownCode',                s:d5, '',   '')
call <sid>hi('markdownError',               s:n3, s:d1, '')
call <sid>hi('markdownCodeBlock',           s:d5, '',   '')
call <sid>hi('markdownHeadingDelimiter',    s:h2, '',   '')

" NERDTree highlighting
call <sid>hi('NERDTreeDirSlash',            s:h2, '',   '')
call <sid>hi('NERDTreeExecFile',            s:n3, '',   '')

" PHP highlighting
call <sid>hi('phpMemberSelector',           s:n3, '',   '')
call <sid>hi('phpComparison',               s:n3, '',   '')
call <sid>hi('phpParent',                   s:n3, '',   '')

" Python highlighting
call <sid>hi('pythonDot',                   s:d5, '',   '')
call <sid>hi('pythonOperator',              s:n4, '',   '')
call <sid>hi('pythonRepeat',                s:n4, '',   '')

" pythonAsync
" pythonBuiltin
" pythonComment
" pythonConditional
" pythonDecorator
" pythonDecoratorName
" pythonDoctest
" pythonDoctestValue
" pythonEscape
" pythonException
" pythonExceptions
" pythonFunction
" pythonInclude
" pythonNumber
" pythonQuotes
" pythonRawString
" pythonSpaceError
" pythonStatement
" pythonString
" pythonTodo
" pythonTripleQuotes

call <sid>hi('BracelessIndent',             s:n4, s:d3, '')

" Ruby highlighting
call <sid>hi('rubyAttribute',               s:h2, '',   '')
call <sid>hi('rubyConstant',                s:h3, '',   '')
call <sid>hi('rubyInterpolation',           s:d5, '',   '')
call <sid>hi('rubyInterpolationDelimiter',  s:n5, '',   '')
call <sid>hi('rubyRegexp',                  s:h1, '',   '')
call <sid>hi('rubySymbol',                  s:d5, '',   '')
call <sid>hi('rubyStringDelimiter',         s:d5, '',   '')

" SASS highlighting
call <sid>hi('cssIncludeKeyword',           s:n1, '',   '')

call <sid>hi('sassClassChar',               s:h4, '',   '')
call <sid>hi('sassInclude',                 s:n1, '',   '')
call <sid>hi('sassMixinName',               s:h4, '',   '')
call <sid>hi('sassMixing',                  s:n4, '',   '')
call <sid>hi('sassidChar',                  s:n6, '',   '')

call <sid>hi('scssFunctionName',            s:n3, '',   '')
call <sid>hi('scssInclude',                 s:n1, '',   '')
call <sid>hi('scssMixinName',               s:h4, '',   '')
call <sid>hi('scssMixinParams',             s:d4, '',   '')
call <sid>hi('scssSelectorChar',            s:d5, '',   '')
call <sid>hi('scssVariable',                s:n2, '',   '')

" Signify highlighting
" call <sid>hi('SignifySignAdd',              s:d5, s:d2, '')
" call <sid>hi('SignifySignChange',           s:h2, s:d2, '')
" call <sid>hi('SignifySignDelete',           s:n6, s:d2, '')

" fugitive higlighthing
call <sid>hi('gitCommitSummary',            s:n1, '',   'none')

" neomake
call <sid>hi('NeomakeError',                s:d5, s:d1, '')
call <sid>hi('NeomakeWarning',              s:h2, s:d1, '')
call <sid>hi('NeomakeInfo',                 s:n6, s:d1, '')
call <sid>hi('NeomakeMessage',              s:n4, s:d1, '')

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:d1 s:d2 s:d3 s:d4 s:d5 s:n3 s:n2 s:n1 s:n6 s:h4 s:h3 s:h1 s:h2 s:n4 s:n5
