scriptencoding utf-8

if exists('g:loaded_airbpm') || &cp
  finish
endif
let g:loaded_airbpm = 1

" Init: autocmds {{{1
augroup airbpm
  autocmd!
  autocmd BufEnter,BufWritePost     * call airbpm#update_git_flag()
augroup END

" Init: configure airline {{{1
" Hard dividers don't look so good in iTerm with some transparency
if !has('gui_running')
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
endif

let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerline'
" Add a separator between file encoding and file format
let g:airline_section_y = "%{strlen(&fenc)>0?&fenc:'  '}%{strlen(&ff)>0?'   '.&ff:''}"
" Format for trailing and mixed indent warning
let g:airline#extensions#whitespace#trailing_format = 'trailing:%s'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent:%s'

call airline#parts#define_raw('modflag', '%{ &mod ? " +" : "" }')
call airline#parts#define_raw('gitflag', '%{exists("b:git_flag") ? b:git_flag : ""}')
call airline#parts#define_raw('filename', '%f')
call airline#parts#define_accent('modflag', 'red')
call airline#parts#define_accent('gitflag', 'yellow')

let g:airline_section_c = airline#section#create(['%<', 'filename', 'gitflag', 'modflag', ' ', 'readonly'])
let g:airline_inactive_collapse = 0

" vim: et sw=2 sts=2
