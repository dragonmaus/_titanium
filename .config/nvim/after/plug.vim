call neomake#configure#automake('inrw', 500)

let g:Illuminate_delay = 0
let g:lightline = {
      \   'active': {
      \     'left': [
      \       [ 'mode', 'paste' ],
      \       [ 'gitbranch', 'readonly', 'maximumpath', 'modified' ],
      \       [ 'currentdir' ],
      \     ],
      \     'right': [
      \       [ 'lineinfo' ],
      \       [ 'percent' ],
      \       [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ],
      \     ],
      \   },
      \   'colorscheme': 'iceberg',
      \   'component_function': {
      \     'charvaluehex': 'LightlineCharvaluehex',
      \     'currentdir': 'LightlineCurrentdir',
      \     'gitbranch': 'LightlineGitbranch',
      \     'maximumpath': 'LightlineMaximumpath',
      \   },
      \ }

function! LightlineCharvaluehex()
  if ScreenIsNarrow()
    return ''
  endif
  let l:char = char2nr(getline('.')[col('.')-1])
  let l:fmt = l:char > 0xFF ? '0x%04X' : '0x%02X'
  return printf(l:fmt, l:char)
endfunction

function! LightlineCurrentdir()
  if ScreenIsWide()
    return SubstituteDirectoryPrefix(getcwd(), expand('~'), '~')
  endif
  return ''
endfunction

function! LightlineGitbranch()
  if ScreenIsNarrow()
    return ''
  endif
  return fugitive#head()
endfunction

function! LightlineMaximumpath()
  if ScreenIsNarrow()
    return expand('%:t')
  endif
  if ScreenIsWide()
    return SubstituteDirectoryPrefix(expand('%:p'), expand('~'), '~')
  endif
  return SubstituteDirectoryPrefix(expand('%:p'), getcwd(), '')
endfunction

function! ScreenIsNarrow()
  return winwidth(0) <= 70
endfunction

function! ScreenIsWide()
  return winwidth(0) > 90
endfunction

function! SubstituteDirectoryPrefix(expr, pat, sub)
  if empty(a:expr)
    return ''
  endif
  let l:expr = a:expr . '/'
  let l:pat = empty(a:pat) ? a:pat : '^' . a:pat . '/'
  let l:sub = empty(a:sub) ? a:sub : a:sub . '/'
  return substitute(substitute(l:expr, l:pat, l:sub, ''), '/$', '', '')
endfunction

colorscheme iceberg
highlight Comment gui=italic cterm=italic term=italic
