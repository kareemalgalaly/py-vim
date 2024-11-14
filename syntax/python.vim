if exists("b:current_syntax")
  finish
endif

syn clear

" Load bundled verilog defaults
source $VIMRUNTIME/syntax/python.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight Groups

syn keyword commentBold   CANCELLED DONE   containedin=pythonComment contained 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight Styles

hi link commentBold     vimAutoEvent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let b:current_syntax="python"
