if !exists('*fugitive#detect')
  finish
endif

function! airbpm#flag#get_git_status()
  let path = resolve(expand('%:p'))
  call fugitive#detect(path)
  if exists('b:git_dir')
    let work_tree = fnamemodify(b:git_dir, ':h')
    let status = system('git --git-dir=' . b:git_dir . ' --work-tree=' . work_tree . ' status --porcelain ' . path)
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
