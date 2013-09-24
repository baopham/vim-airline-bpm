" Theme to mimic the default colorscheme of powerline
"
" Differences from default powerline:
" * Paste indicator isn't colored different
" * Far right hand section matches the color of the mode indicator
"
" Differences from other airline themes:
" * No color differences when you're in a modified buffer
" * Visual mode only changes the mode section. Otherwise
"   it appears the same as normal mode

let s:gui_white = '#ffffff'
let s:cterm_white = '231'
let s:gui_dark = '#121212'
let s:cterm_dark = '233'
let s:gui_dark_gray = '#303030'
let s:cterm_dark_gray = 236
let s:gui_light_gray = '#b2b2b2'
let s:cterm_light_gray = 250
let s:gui_med_gray_hi = '#444444'
let s:cterm_med_gray_hi = 238
let s:gui_orange = '#d7af5f'
let s:cterm_orange = 179

" Normal mode                                    " fg             & bg
let s:N1 = [ '#005f00' , '#afd700' , 22  , 148 ] " darkestgreen   & brightgreen
let s:N2 = [ s:gui_light_gray , s:gui_med_gray_hi , s:cterm_light_gray , s:cterm_med_gray_hi ]
let s:N3 = [ '#ffffff' , '#303030' , 231 , 233 ] " white          & darkgray
let s:N4 = [ s:gui_light_gray , s:gui_med_gray_hi , s:cterm_light_gray , s:cterm_med_gray_hi ]
let s:N5 = [ '#ffffff' , s:gui_dark_gray , 231 , 233 ] " white          & darkgray

" Insert mode                                    " fg             & bg
let s:I1 = [ '#005f5f' , '#ffffff' , 23  , 231 ] " darkestcyan    & white
let s:I2 = [ s:gui_white , '#0087af' , s:cterm_white  , 31  ] " white       & darkblue
let s:I3 = [ s:gui_white , '#005f87' , s:cterm_white , 24  ] " white     & darkestblue

" Visual mode                                    " fg             & bg
let s:V1 = [ '#080808' , '#ffaf00' , 232 , 214 ] " gray3          & brightestorange

" Replace mode                                   " fg             & bg
let s:RE = [ s:gui_white , '#d70000' , s:cterm_white, 160 ] " white          & brightred

let g:airline#themes#powerline#palette = {}

let g:airline#themes#powerline#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3, s:N5, s:N4, s:N1)

let g:airline#themes#powerline#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#powerline#palette.insert_replace = {
      \ 'airline_a': [ s:RE[0]   , s:I1[1]   , s:RE[1]   , s:I1[3]   , ''     ] }

let g:airline#themes#powerline#palette.visual = {
      \ 'airline_a': [ s:V1[0]   , s:V1[1]   , s:V1[2]   , s:V1[3]   , ''     ] }

let g:airline#themes#powerline#palette.replace = copy(airline#themes#powerline#palette.normal)
let g:airline#themes#powerline#palette.replace.airline_a = [ s:RE[0] , s:RE[1] , s:RE[2] , s:RE[3] , '' ]


let s:IA = [ '#b2b2b2' , s:N3[1] , s:N2[3] , s:N3[3] , '' ]
let g:airline#themes#powerline#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

let s:IA1 = [s:gui_light_gray, s:gui_dark_gray, s:cterm_light_gray, s:cterm_dark_gray, '']
let s:IA3 = [s:gui_light_gray, s:gui_dark, s:cterm_light_gray, s:cterm_dark, '']
let g:airline#themes#powerline#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA1, s:IA3)
let g:airline#themes#powerline#palette.inactive_modified = {
      \ 'airline_c': [s:gui_orange, '', s:cterm_orange, '', ''],
      \ }
