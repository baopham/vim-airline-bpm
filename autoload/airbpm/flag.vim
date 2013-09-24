if !exists('*fugitive#detect')
  finish
endif

function! airbpm#flag#get_git_status()
  let s:path = resolve(expand('%:p'))
  call fugitive#detect(s:path)
  if exists('b:git_dir')
    let s:work_tree = fnamemodify(b:git_dir, ':h')
    let status = system('git --git-dir=' . b:git_dir . ' --work-tree=' . s:work_tree . ' status --porcelain ' . s:path)
    if status != ''
      let flag = split(status)[0]
      if (flag == 'fatal:')
        echoerr status
      endif
      return ' ' . flag . ' '
    endif
  endif
  return ''
endfunction
