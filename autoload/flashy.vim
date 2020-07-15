" flashy.vim
" Desc: A flashcard plugin for vim
" Maintainer: Nolan Prochnau <parvus.mortalis@gmail.com>

function! s:flip() abort
  let s:side = !s:side
  call s:display()
  return ''
endfunction

function! s:next() abort
  let s:cardidx += 1
  let s:side = 0
  call s:display()
  return ''
endfunction

function! s:prev() abort
  let s:cardidx -= 1
  call s:display()
  return ''
endfunction

function! s:display() abort
  if s:cardidx < len(g:flashy) && s:cardidx >= 0
    call setline(line('.'), g:flashy[s:cardidx][s:side])
    return ''
  else
    echohl Error
    echo 'No more cards to display'
    echohl Normal
    let s:cardidx = s:cardidx < 0 ? 0 : len(g:flashy) - 1
  endif
endfunction

function! s:leave() abort
  call goyo#execute(1, "")

  let &spell = s:spellPrev

  let l:bufnr = bufnr('flashyTmp')
  execute 'bdelete! ' . l:bufnr
  let g:inFlashy = 0
endfunction

function! flashy#list() abort
  let flashes = []

  for flash in g:flashy
    let val = '[ ' . flash[0] . ', ' . flash[1] . ' ]'
    call add(flashes, val)
  endfor

  return flashes
endfunction

function! flashy#flash() abort
  if exists('g:flashy')
    unlet g:flashy
  endif

  if &ft ==# 'vim'
    source %
  else
    echoerr 'Current file is not a vim file.'
  endif

  if !exists('g:flashy')
    echoerr 'g:flashy is undefined.'
  endif

  let g:inFlashy = 1
  tabnew flashyTmp
  call goyo#execute(0, "80x1")

  let s:spellPrev = &spell
  set nospell

  let s:cardidx = 0
  let s:side = 0
  call s:display()

  command -buffer Exit call <SID>leave()
  nnoremap <buffer><silent> q :Exit<CR>
  nnoremap <buffer><silent> h i<C-R>=<SID>prev()<CR><ESC>
  nnoremap <buffer><silent> j i<C-R>=<SID>flip()<CR><ESC>
  nnoremap <buffer><silent> k i<C-R>=<SID>flip()<CR><ESC>
  nnoremap <buffer><silent> l i<C-R>=<SID>next()<CR><ESC>
endfunction
