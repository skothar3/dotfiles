" Set vim.surround to include $
setlocal iskeyword+=$
setlocal formatoptions-=o

" ALE shfmt options
" Indent with 4 spaces, simplify the code, indent switch cases, use POSIX
let b:ale_sh_shfmt_options='-i 4 -s -ci -ln bash'
