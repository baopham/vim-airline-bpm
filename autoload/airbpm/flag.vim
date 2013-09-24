if !exists('*fugitive#head')
  finish
endif

function! airbpm#flag#get_git_status()
  let s:path = resolve(expand('%:p'))
  if fugitive#head(s:path) != ''
    let s:work_tree = fnamemodify(b:git_dir, ':h')
    let status = system('git --git-dir=' . b:git_dir . ' --work-tree=' . s:work_tree . ' status --porcelain ' . s:path)
    if status != ''
      return ' ' . split(status)[0] . ' '
    endif
  endif
  return ''
endfunction
