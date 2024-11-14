" Vim filetype plugin
" Language: Python
" Maintainer: Kareem Ahmad

" let b:did_ftplugin if you want to disable the original/bundled plugin

if exists("b:did_ftplugin")
  finish
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load bundled verilog defaults

source $VIMRUNTIME/ftplugin/python.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Expressions for Autocomplete plugin

let s:eol = '\s*(//.*)?$'
let s:com = '// ' . repeat("-", 50)
let s:hdr = '//*****************************************************************************'

let s:autocomplete_matches = [
 \      ['\v\{'.s:eol                            , '\N\:\n}'                 ],
 \      ['\v\('.s:eol                            , '\N\:\n)'                 ],
 \      ['\v\['.s:eol                            , '\N\:\n]'                 ],
 \ ]

if has_key(g:, "autocomplete_matches")
    call autocomplete#register("python", s:autocomplete_matches)
endif

