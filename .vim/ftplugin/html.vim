" Set indentation to two spaces
setlocal softtabstop=2
setlocal shiftwidth=2
" Turn off linewrapping
setlocal nowrap

augroup html
    autocmd!
    " Reindent file before reading and writing
    autocmd BufWritePre,BufRead *.html :normal gg=G

augroup END
