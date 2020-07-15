" flashy.vim
" Desc: A flashcard plugin for vim
" Maintainer: Nolan Prochnau <parvus.mortalis@gmail.com>

if exists('g:loaded_flashy') || !exists('*goyo#execute')
  " finish
endif
let g:loaded_flashy = 1

let g:inFlashy = 0

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

function! s:flash() abort
  try
    call flashy#flash()
  endtry
endfunction

command! -nargs=0 FlashList call <SID>flashlist()
command! -nargs=0 Flash call <SID>flash()
