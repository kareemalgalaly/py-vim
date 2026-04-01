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

let s:arg = 'import argparse\n\nargparser = argparse.ArgumentParser(prog="\<%:t:r\>", description = "\:")\n' .
          \ 'argparser.add_argument("arg", type=str, help="")\n' .
          \ 'argparser.add_argument("optarg", type=str, nargs="?", help="")\n' .
          \ 'argparser.add_argument("-r", "--recurse" , type=int, nargs="?", default=0, const=2, help="")\n' .
          \ 'argparser.add_argument("-o", "--matchonly", default=False, const=True, action="store_const", help="")\n' .
          \ 'argparser.add_argument("remainder", nargs=argparse.REMAINDER, help="")\n' .
          \ 'args = argparser.parse_args()'

let s:log = 'import logging\nlogger = logging.getLogger(__name__)\n'

let s:autocomplete_matches = [
 \      ['\v\{'.s:eol                            , '\N\:\n}'                                        ],
 \      ['\v\('.s:eol                            , '\N\:\n)'                                        ],
 \      ['\v\['.s:eol                            , '\N\:\n]'                                        ],
 \      ['args'                                  , '\!'.s:arg                                       ],
 \      ['log'                                   , '\!'.s:log                                       ],
 \      ['main'                                  , '\!if __name__ == "__main__":\N\:'               ],
 \ ] + autocomplete#common("#")

if exists('*autocomplete#register') | call autocomplete#register("python", s:autocomplete_matches) | endif
