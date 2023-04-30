" BASIC SETTINGS ---------------------- {{{
" Allow filetype recognition by Vim
filetype on
" Allow custom filetype plugins
filetype plugin on
" Add recursive file searching with :find
set path+=**
" File autocompletion menu
set wildmenu
" Number of nested folds to display
set foldcolumn=2
" Use default {{{}}} for folds
set foldmethod=marker
" Hide mode from statusbar
set noshowmode
" Background color
set background=dark
" Start searching before pressing enter
set incsearch
" Highlight search results
" set hlsearch
" Highlight the current line
set cursorline
" Allow yy, etc. to interact with OS X clipboard
set clipboard=unnamed
" Set show matching parentheses
set showmatch
" Set line numbering
set number
" Indent highlighting
set list lcs=tab:··\|,trail:·
" Get aliases from bash dotfiles
let $BASH_ENV = "~/.bash_aliases"
" Set syntax highlighting
syntax on
" Set colorscheme
" colorscheme molokai
colorscheme gruvbox
" Enable mouse functionality
if has('mouse')
  set mouse=a
endif
"}}}

" KEY MAPPINGS ---------------------- {{{

" NORMAL MODE ---------------------- {{{
" Edit vimrc in vsplit pane
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
" Surround word in double quotes
nnoremap <leader>" viw<Esc>a"<Esc>bi"<Esc>lel
" Surround word in single quotes
nnoremap <leader>' viw<Esc>a'<Esc>bi'<Esc>lel
" Open NERDTree
nnoremap <leader>] :NERDTreeToggle<CR>
" Open terminal at bottom
nnoremap <leader>t :bo term<CR>
" Don't let x and c to spoil the yank register
nnoremap x "_x
nnoremap c "_c
" Quick save
nnoremap W :w<CR>
" Save and close current buffer
nnoremap Q :w\|bd<CR>
" Quick quit
nnoremap QQ :wqa<CR>
" Quick open bash dotfiles
nnoremap <leader>vba :e ~/.bash_aliases<CR>
nnoremap <leader>vbrc :e ~/.bashrc<CR>
nnoremap <leader>vbp :e ~/.bash_profile<CR>
" Cycle buffers
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
"}}}

" INSERT MODE ---------------------- {{{
" Easier Esc
inoremap jk <Esc>
inoremap <Esc> <nop>
" Quicker brackets
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
" Quicker quotes
inoremap " ""<Left>
inoremap ' ''<Left>
"}}}

" VISUAL MODE ---------------------- {{{
" Easier Esc
vnoremap jk <Esc>
"}}}

"}}}

" ABBREVIATIONS ---------------------- {{{
iabbrev @@ sid.kothari7@gmail.com
iabbrev ssig ----------------------<CR>
	    \Sid Kothari<CR>
	    \sid.kothari7@gmail.com<CR>
	    \----------------------
"}}}

" PLUGINS ---------------------- {{{

" ALE ---------------------- {{{
" Linting configuration
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'html':['eslint'],
\   'css':['stylelint'],
\   'ruby': ['rubocop']
\}

" Fixing configuration
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'html': ['prettier', 'eslint'],
\   'css': ['prettier', 'stylelint'],
\   'ruby': ['rubocop']
\}

" Format configuration
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"}}}

" AIRLINE ---------------------- {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"}}}

" NERDCOMMENTER ---------------------- {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
nnoremap <leader>\ <plug>NERDCommenterInvert
"}}}

" VIM-PLUG ---------------------- {{{
call plug#begin('~/.vim/plugged')

" Nerdtree
Plug 'preservim/nerdtree'
" Nerdcommenter
Plug 'preservim/nerdcommenter'
" ALE
Plug 'dense-analysis/ale'
" Emmet
Plug 'mattn/emmet-vim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Fugitive (Git visualizer)
Plug 'tpope/vim-fugitive'
" Gruvbox colortheme
Plug 'morhetz/gruvbox'

call plug#end()
" }}}
"}}}
