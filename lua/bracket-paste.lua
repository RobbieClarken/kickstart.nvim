vim.cmd([[
  function! s:Map(...) abort
    let [mode, head, rhs; rest] = a:000
    let flags = get(rest, 0, '') . (rhs =~# '^<Plug>' ? '' : '<script>')
    let tail = ''
    let keys = get(g:, mode.'remap', {})
    if type(keys) == type({}) && !empty(keys)
      while !empty(head) && len(keys)
        if has_key(keys, head)
          let head = keys[head]
          if empty(head)
            let head = '<skip>'
          endif
          break
        endif
        let tail = matchstr(head, '<[^<>]*>$\|.$') . tail
        let head = substitute(head, '<[^<>]*>$\|.$', '', '')
      endwhile
    endif
    if head !=# '<skip>' && empty(maparg(head.tail, mode))
      return mode.'map ' . flags . ' ' . head.tail . ' ' . rhs
    endif
    return ''
  endfunction

  function! s:putline(how, map) abort
    let [body, type] = [getreg(v:register), getregtype(v:register)]
    if type ==# 'V'
      exe 'normal! "'.v:register.a:how
    else
      call setreg(v:register, body, 'l')
      exe 'normal! "'.v:register.a:how
      call setreg(v:register, body, type)
    endif
    silent! call repeat#set("\<Plug>(unimpaired-put-".a:map.")")
  endfunction

  nnoremap <silent> <Plug>(unimpaired-put-above) :call <SID>putline('[p', 'above')<CR>
  nnoremap <silent> <Plug>(unimpaired-put-below) :call <SID>putline(']p', 'below')<CR>
  nnoremap <silent> <Plug>(unimpaired-put-above-rightward) :<C-U>call <SID>putline(v:count1 . '[p', 'Above')<CR>>']
  nnoremap <silent> <Plug>(unimpaired-put-below-rightward) :<C-U>call <SID>putline(v:count1 . ']p', 'Below')<CR>>']
  nnoremap <silent> <Plug>(unimpaired-put-above-leftward)  :<C-U>call <SID>putline(v:count1 . '[p', 'Above')<CR><']
  nnoremap <silent> <Plug>(unimpaired-put-below-leftward)  :<C-U>call <SID>putline(v:count1 . ']p', 'Below')<CR><']
  nnoremap <silent> <Plug>(unimpaired-put-above-reformat)  :<C-U>call <SID>putline(v:count1 . '[p', 'Above')<CR>=']
  nnoremap <silent> <Plug>(unimpaired-put-below-reformat)  :<C-U>call <SID>putline(v:count1 . ']p', 'Below')<CR>=']
  nnoremap <silent> <Plug>unimpairedPutAbove :call <SID>putline('[p', 'above')<CR>
  nnoremap <silent> <Plug>unimpairedPutBelow :call <SID>putline(']p', 'below')<CR>

  exe s:Map('n', '[p', '<Plug>(unimpaired-put-above)')
  exe s:Map('n', ']p', '<Plug>(unimpaired-put-below)')
  exe s:Map('n', '[P', '<Plug>(unimpaired-put-above)')
  exe s:Map('n', ']P', '<Plug>(unimpaired-put-below)')
]])
