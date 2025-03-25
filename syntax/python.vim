if exists("b:current_syntax")
  finish
endif

syn clear

" Load bundled verilog defaults
source $VIMRUNTIME/syntax/python.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight Groups

syn keyword pythonTodo CANCELLED DONE contained

"syn match pyNum  '\<0b\(_*[01]\+\)\+\>'
"syn match pyNum  '\<0x\(_*[0-9abcdefABCDEF]\+\)\+\>' \x

syn region  pythonString matchgroup=pythonQuotes
      \ start=+f\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=pythonEscape,pythonFEsc,pythonFExp,@Spell

syn match pythonFExp '{\zs[^{}]\{-}\ze}\(}}\)*[^}]' contains=TOP,pythonFSpc contained  
syn match pythonFEsc '\({{\)\+'     contained
syn match pythonFEsc '\(}}\)\+[^}]' contained

"syn match pyFStr 'f".\{-}[^\\]"' contains=pyFExp,pyFEsc
"syn match pyFStr "f'.\{-}[^\\]'" contains=pyFExp,pyFEsc
"syn match pyFExp '{\zs[^{}]\{-}\ze}\(}}\)*[^}]' contains=TOP contained  
"syn match pyFEsc '\({{\)\+'     contained
"syn match pyFEsc '\(}}\)\+[^}]' contained
syn match pythonFSpc ':\w\{-}}'

syn match pythonDecorator '@\w\+'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight Styles

"hi link commentBold     vimAutoEvent

"hi link pyNum  Constant
"hi link pyFStr String
hi link pythonFExp Operator
hi link pythonFSpc pythonEscape
hi link pythonFEsc pythonEscape
hi clear pythonBuiltin 
hi link pythonBuiltin Statement

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let b:current_syntax="python"

