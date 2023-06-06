" ALE shfmt options
" Indent with 4 spaces, simplify script, indent switch cases, use Bash variant
let b:ale_sh_shfmt_options='-i 4 -s -ci -ln bash'

" ALE shellcheck options
" Use bash dialect explicitly
let b:ale_sh_shellcheck_options='-s bash'
