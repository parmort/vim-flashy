fun! s:enter()
  let b:flashy_unmap = 3

  nmap <buffer> n <Plug>FlashyNext
  nmap <buffer> p <Plug>FlashyPrev
  nmap <buffer> f <Plug>FlashyFlip
endfun

au User GoyoEnter call <SID>enter()

let g:flashy = [
      \ [ 'Test1', 'Tester1' ],
      \ [ 'Test2', 'Tester2' ],
      \ [ 'Test3', 'Tester3' ],
      \ [ 'Test4', 'Tester4' ],
      \ [ 'Test5', 'Tester5' ],
      \ ]
