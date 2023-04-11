set nocompatible
filetype plugin on
set laststatus=2
set ruler
set path+=**
set wildmenu
set hlsearch

" Set line numbering
set number

" Set syntax highlighting
syntax on

" Set colorscheme
colorscheme desert

" Enable mouse functionality
if has('mouse')
  set mouse=a
endif

" Remap <CR> in normal mode to insert line
nnoremap <CR> I<CR><Esc>
" Remap delete in normal mode to delete line
nnoremap <BS> I<BS><Esc>

" Indent highlighting
set list lcs=tab:<->,trail:·
let g:indentLine_setColors = 0
let g:indentLine_color_term = 140
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Shortcut to open NERDTree
nnoremap <leader>] :NERDTreeToggle<CR>

" ALE Linting Configuration
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_linters_explicit = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'html': ['prettier'],
\   'css': ['prettier']
\}


let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
