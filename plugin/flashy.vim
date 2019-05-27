" flashy.vim
" Desc: A flashcard plugin for vim
" Maintainer: Nolan Prochnau <parvus.mortalis@gmail.com>

if exists('g:loaded_flashy') || !exists('*goyo#execute')
  " finish
endif
let g:loaded_flashy = 1

function! s:flashlist() abort
  cexpr flashy#list()
  copen
endfunction

command! -nargs=0 FlashList call <SID>flashlist()
