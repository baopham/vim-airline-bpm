scriptencoding utf-8

if exists('b:autoloaded_airbpm')
  finish
endif
let b:autoloaded_airbpm = 1

function! airbpm#update_git_flag() abort
  let b:git_flag = airbpm#flag#get_git_status()
endfunction
