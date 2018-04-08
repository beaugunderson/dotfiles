runtime! syntax/htmldjango.vim

syntax match Entity "&lt;" conceal cchar=<
syntax match Entity "&gt;" conceal cchar=>
syntax match Entity "&amp;" conceal cchar=&

syntax match Tag /\v[<][a-zA-Z 0-9"\/=-]+[>]/ conceal

set conceallevel=2
