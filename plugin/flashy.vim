" flashy.vim
" Desc: A flashcard plugin for vim
" Maintainer: Nolan Prochnau <parvus.mortalis@gmail.com>

if !exists(':Goyo')
  echoerr 'Flashy: Please install goyo!'
  finish
endif

if exists('g:flashy_loaded')
  if !exists('g:flashy_debug')
    finish
  else
    echohl Error
    echo 'Flashy Reloaded'
    echohl Normal
  endif
endif

let g:flashy_loaded = 1
let g:flashy_running = 0

if !exists('g:flashy_unmap')
  let g:flashy_unmap = 0
endif

function! s:flashlist() abort
  try
    cexpr flashy#list()
    copen
  catch /E121/
    echoerr 'g:flashy is undefined'
  catch /E716/
    echoerr 'g:flashy is not defined correctly'
  endtry
endfunction

command! -nargs=0 FlashList call <SID>flashlist()
command! -nargs=0 Flash call flashy#flash()
