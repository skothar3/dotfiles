" Set indentation to two spaces
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal formatoptions-=o
" Abbreviations
iabbrev <buffer> dg display:<Space>grid

" Map the localleader key to backslash
let maplocalleader = "\\"

" NORMAL MODE ---------------------- 
" Append semicolon to added newline
" nnoremap <buffer> o o;<Left>
" nnoremap <buffer> O O;<Left>
" Append semicolon to existing line
nnoremap <buffer> <localleader>; mqA;<Esc>`q
