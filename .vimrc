" BASIC SETTINGS ---------------------- {{{
" Set up indentation
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
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
" 2 lines above/below cursor when scrolling
set scrolloff=0
" Allow yy, etc. to interact with OS X clipboard
set clipboard=unnamed
" Set show matching parentheses
set showmatch
" Set relative line numbering
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
" Highlight code folds 
highlight Folded ctermfg=yellow ctermbg=NONE
"}}}

" KEY MAPPINGS ---------------------- {{{

" Map the leader key to a spacebar.
 let mapleader = ","

" NORMAL MODE ---------------------- 
" Disable arrow keys to learn hjkl!!
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
" Edit vimrc in vsplit pane
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
" Open NERDTree
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
" Open terminal at bottom with aliases
nnoremap <leader>t :bo term<CR>. ~/.bashrc<CR>. ~/.bash_aliases<CR>
" Don't let x and c spoil the yank register
nnoremap x "_x
nnoremap c "_c
" Toggle code folds
nnoremap <space> za
" Quick save
nnoremap W :update<CR>
" Save and close current buffer and then it
nnoremap E :w <bar> bd<CR>
" Quick quit
nnoremap EE :wqa<CR>
" Quick open bash dotfiles
nnoremap <leader>vba :e ~/.bash_aliases<CR>
nnoremap <leader>vbrc :e ~/.bashrc<CR>
nnoremap <leader>vbp :e ~/.bash_profile<CR>
nnoremap <leader>vbsh :e ~/.bash_profile <bar> :e ~/.bashrc <bar> :e ~/.bash_aliases <bar> :e ~/.vimrc <bar> :e ~/.inputrc <bar> :e ~/.dotfiles/install.sh <CR>
" Cycle buffers
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
" Remap NERDCommenter comment invert
nnoremap <leader><space> <plug>NERDCommenterInvert

" INSERT MODE ---------------------- 
" Escape to normal mode and stay in place
inoremap jk <Esc>l
inoremap <Esc> <nop>
" Quicker brackets
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
" Paste in insert mode
inoremap <C-p> <C-r>0
" Jump forward/backword word
inoremap <leader><Left> <Esc>bi
inoremap <leader><Right> <Esc>wi

" VISUAL MODE ---------------------- 
" Easier Esc
vnoremap jk <Esc>
vnoremap <leader><space> <plug>NERDCommenterInvert

" COMMAND MODE ---------------------- 
" Easier Esc
cnoremap jk <Esc>

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
\   'css':['stylelint'],
\   'html':['eslint'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'sh': ['shellcheck']
\}

" Fixing configuration
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier', 'stylelint'],
\   'html': ['prettier', 'eslint'],
\   'javascript': ['prettier', 'eslint'],
\   'ruby': ['rubocop'],
\   'sh': ['shfmt']
\}

" Format configuration
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 1
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
" Surround text with quotes, brackets, tags, etc.
Plug 'tpope/vim-surround'
" Gruvbox colortheme
Plug 'morhetz/gruvbox'

call plug#end()
" }}}
"}}}
