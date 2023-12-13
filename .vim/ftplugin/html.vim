" Set indentation to two spaces
setlocal softtabstop=2
setlocal shiftwidth=2
" Turn off linewrapping
setlocal nowrap

let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "p"


augroup html
    autocmd!
    " Reindent file before reading and writing
    autocmd BufWritePre,BufRead *.html :normal gg=G

augroup END
