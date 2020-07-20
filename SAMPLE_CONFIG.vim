" Enable debug mode (not recommended unless developing)
let g:flashy_debug = 1

" Unmap every key globally
let g:flashy_unmap = 3

" Map n, p, <space>, and c instead
fun! s:enterGoyo()
  if exists('g:flashy_loaded') && g:flashy_running == 1
    " Put buffer-specific variables in here as well
    " let b:flashy_unmap = 1 " Unmap standard flipping keys for the current file

    " Put gated config in here
    " Limelight! " Turn limelight off

    nmap <buffer> n <Plug>FlashyNext
    nmap <buffer> p <Plug>FlashyPrev
    nmap <buffer> <space> <Plug>FlashyFlip
    nnoremap <buffer><silent> c :Exit<CR>
  endif
endfun

autocmd User GoyoEnter call <SID>enterGoyo()
