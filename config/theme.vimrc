" Theme configuration
func! s:setCustomColors()
  " Editor
  call one#highlight('Normal',       'abb2bf',  '303034',  '')
  call one#highlight('TabLineFill',  '',        '303034',  'none')
  call one#highlight('TabLine',      '676a70',  '47474c',  'none')
  call one#highlight('TabLineSel',   'FFFFFF',  '303034',  'none')
  call one#highlight('ColorColumn',  '',        '2d2d30',  'none')
  call one#highlight('WinSeparator',  '000000', '000000',  'none')

  " Ruby
  " call one#highlight('rubyFunction', '',        '',        'bold')
endfunc

 autocmd ColorScheme * call s:setCustomColors()

set termguicolors
let g:airline_theme='minimalist'
colorscheme one
let g:one_allow_italics = 1
set background=dark

highlight Normal guibg=none
highlight iCursor guibg=white
set guicursor+=i-ci-ve:ver25-iCursor


highlight VertSplit ctermfg=233 guifg=#141414 guibg=#141414
" recommend color for terminal: 262626 or 212124

" I changed airline/themes/minimalist.vim
" let N1 = [ '#E4E4E4', '#141400', 254, 237 ]
" let N2 = [ '#E4E4E4', '#4E4E4E', 254, 239 ]
" let N3 = [ '#EEEEEE', '#141414', 255, 235 ]
