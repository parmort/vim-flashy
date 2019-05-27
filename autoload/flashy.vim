" flashy.vim
" Desc: A flashcard plugin for vim
" Maintainer: Nolan Prochnau <parvus.mortalis@gmail.com>

function! flashy#error(err) abort
  echohl ErrorMsg
  echo a:err
  echohl Normal
endfunction

function! flashy#list() abort
  let flashes = []

  for flash in g:flash
    let val = '[ ' . flash[0] . ', ' . flash[1] . ' ]'
    call add(flashes, val)
  endfor

  return flashes
endfunction
