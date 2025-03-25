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
let s:com = '## ' . repeat("-", 60-3)
let s:hdr = '###############################################################################\n' .
          \ '# File        : \<%\>\n' .
          \ '# Author      : \<$USER\>\n' .
          \ '# Created     : \d\n' .
          \ '# Description : \n' .
          \ '###############################################################################\n\:\n'

let s:arg = 'import argparse\n\nargparser = argparse.ArgumentParser(prog="\<%:t:r\>", description = "\:")\n' .
          \ 'argparser.add_argument("arg", type=str, help="")\n' .
          \ 'argparser.add_argument("-r", "--recurse" , type=int, nargs="?", default=0 , const=2, help="")\n' .
          \ 'argparser.add_argument("-o", "--matchonly", default=False, const=True, action="store_const", help="")\n' .
          \ 'args = argparser.parse_args()'

let s:autocomplete_matches = [
 \      ['\v\{'.s:eol                            , '\N\:\n}'                                        ],
 \      ['\v\('.s:eol                            , '\N\:\n)'                                        ],
 \      ['\v\['.s:eol                            , '\N\:\n]'                                        ],
 \      ['\v# (.*)'.s:eol                        , '\!## \1 \(repeat("-",61-col("."))\)'            ],
 \      ['\vdesc\s+(\w+)\s+(\w+)\s*(.*)$'        , '\!# \(repeat("-",51-col("."))\)\n# \1: \2\n# \(repeat("-",51-col("."))\)\n'],
 \      ['#'                                     , '\!'.s:com                                       ],
 \      ['\vhead'                                , '\!'.s:hdr                                       ],
 \      ['args'                                  , '\!'.s:arg                                       ],
 \      ['main'                                  , '\!if __name__ == "__main__":\n\:'               ],
 \ ]

if has_key(g:, "autocomplete_matches")
    call autocomplete#register("python", s:autocomplete_matches)
endif

