" Enable filetype detection
filetype on 
filetype plugin on
set laststatus=2
set ruler
set path+=**
" Highlight search results
set hlsearch
" Highlight the current line
set cursorline
" Allow yy, etc. to interact with OS X clipboard
set clipboard=unnamed
" Set status line
set statusline=%F         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines

" Set show matching parentheses
set showmatch

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

" KEY MAPPINGS
" let g:mapleader = "-"

" NORMAL MODE
" Shorcut to edit vimrc in vsplit pane
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" Normal enter to insert enter 
nnoremap <cr> i<cr><Esc>
" Surround word in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" Surround word in single quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" Shortcut to open NERDTree
nnoremap <leader>] :NERDTreeToggle<CR>

" INSERT MODE
" Ctrl+d to delete line
inoremap <c-d> <esc>ddi
" Easier Esc
inoremap jk <esc>
inoremap <esc> <nop>


" ABBREVIATIONS
iabbrev @@ sid.kothari7@gmail.com
iabbrev ssig -- <cr>Sid Kothari<cr>sid.kothari7@gmail.com


" Vim code folding syntax
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Indent highlighting
set list lcs=tab:<->,trail:·
let g:indentLine_setColors = 0
let g:indentLine_color_term = 140
let g:indentLine_char_list = ['|', '¦', '┆', '┊']



" ALE Linting configuration
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'html':['eslint'],
\   'css':['stylelint'],
\   'ruby': ['rubocop']
\}


" ALE Fixing configuration
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'html': ['prettier', 'eslint'],
\   'css': ['prettier', 'stylelint'],
\   'ruby': ['rubocop']
\}
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
