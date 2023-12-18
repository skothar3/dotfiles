" BASIC SETTINGS {{{
" Set up indentation
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab
" Set the miliseconds before CursorHold times out (used with CursorHoldI in
" autocommand section)
set updatetime=10000
" Remember undo after quitting
set hidden
" Allow backspace to delete characters previously inserted
set backspace=start,indent
" Allow filetype recognition by Vim
filetype on
" Allow custom filetype plugins
filetype plugin on
" Add recursive file searching with :find
set path+=**
" File autocompletion menu
set wildmenu
" Use default brackets for folds
set foldmethod=marker
" Highlight code folds 
highlight Folded ctermfg=yellow ctermbg=NONE
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
" set clipboard=unnamed
" Set show matching parentheses
set showmatch
" Set hybrid (absolute + relative) line numbering
set number relativenumber
" Open new vsplit windows to the right
set splitright
" Indent highlighting
set list lcs=tab:··\|,trail:·
" Get aliases from bash dotfiles
let $BASH_ENV = "~/.bash_aliases"
" Set syntax highlighting
syntax on
" Enable mouse functionality
if has('mouse')
  set mouse=a
endif
"}}}

 " KEY MAPPINGS {{{

" Map the leader key to comma
let mapleader = ","

" NORMAL MODE ---------------------- 
" Disable arrow keys to learn hjkl!!
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
" More convenient jump to first non-blank character on line
nnoremap 0 ^
nnoremap ^ 0
" Edit vimrc in vsplit pane
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" Source vimrc
nnoremap <leader>.v :source $MYVIMRC<CR>
" Open terminal at bottom with aliases
nnoremap <leader>t :bo term<CR>. ~/.bashrc<CR>. ~/.bash_aliases<CR>
" Yank until end of line
nnoremap Y y$
" Don't let x and c spoil the yank register
nnoremap x "_x
nnoremap c "_c
" Select pasted text
nnoremap gp `[v`]
" Toggle code folds
nnoremap <space> za
" Quick save
nnoremap S :update<CR>
" Save and close current buffer
nnoremap E :w <bar> bd<CR>
" Quick quit
nnoremap EE :wqa<CR>
" Turn off relativenumbers before entering command line (used in conjunction
" with CmdlineLeave autocommand to revert after leaving command line)
nnoremap : :setlocal number norelativenumber<CR>:
" Quick open bash dotfiles
nnoremap <leader>vba :e ~/.bash_aliases<CR>
nnoremap <leader>vbrc :e ~/.bashrc<CR>
nnoremap <leader>vbp :e ~/.bash_profile<CR>
nnoremap <leader>v. :e ~/.bash_profile <bar> :e ~/.bashrc <bar> :e ~/.bash_aliases <bar> :e ~/.vimrc <bar> :e ~/.inputrc <bar> :e ~/.dotfiles/install.sh <CR>
" Cycle buffers
" nnoremap <Tab> :bn<CR>
" nnoremap <S-Tab> :bp<CR>
" Remap NERDCommenter comment invert
nnoremap <leader><space> <plug>NERDCommenterInvert

" INSERT MODE ---------------------- 
" Escape to normal mode and stay in place
inoremap jk <Esc>l
inoremap <Esc> <nop>
" Quicker brackets
" inoremap ( ()<Left>
" inoremap [ []<Left>
" inoremap { {}<Left>
" Quicker quotes
inoremap " ""<Left>
inoremap ' ''<Left>
" Paste in insert mode
inoremap <C-v> <C-r>"

" VISUAL MODE ---------------------- 
" Easier Esc
vnoremap jk <Esc>
" Bulk comment toggle
vnoremap <leader><space> <plug>NERDCommenterInvert
" Quickly move selected text into global search and replace
vnoremap <leader>sg y:%s/<C-r>"//g<Left><Left>
" Quickly move selected text into global search and replace with confirm
vnoremap <leader>sc y:%s/<C-r>"//c<Left><Left>

" COMMAND MODE ---------------------- 
" Easier Esc
cnoremap jk <Esc>

" MOVEMENT OPERATORS ---------------------- 
" Select inside next brackets
onoremap in( :<C-U>normal! f(vi(<CR>
" Select inside last brackets
onoremap il( :<C-U>normal! F)vi(<CR>
" Select inside next square brackets
onoremap in[ :<C-U>normal! f[vi[<CR>
" Select inside last square brackets
onoremap il[ :<C-U>normal! F]vi[<CR>
" Select inside next curly brackets
onoremap in{ :<C-U>normal! f{vi{<CR>
" Select inside last curly brackets
onoremap il{ :<C-U>normal! F}vi{<CR>
" Select inside next double quotes
onoremap in" :<C-U>normal! f"vi"<CR>
" Select inside last double quotes
onoremap il" :<C-U>normal! F"vi"<CR>
" Select inside next single quotes
onoremap in' :<C-U>normal! f'vi'<CR>
" Select inside last single quotes
onoremap il' :<C-U>normal! F'vi'<CR>
"}}}

" ABBREVIATIONS {{{
iabbrev @@ sid.kothari7@gmail.com
iabbrev ssig ----------------------<CR>
	    \Sid Kothari<CR>
	    \sid.kothari7@gmail.com<CR>
	    \----------------------
"}}}

" AUTOCOMMANDS {{{
augroup vimrc
  " Remove all existing vimrc autocommands
  autocmd!
  " Write buffer after exiting Insert mode
  autocmd InsertLeave * :update
  " Exit Insert mode if no key press after 'updatetime'miliseconds
  autocmd CursorHoldI * :stopinsert
  " Turn on relativenumbers when leaving command line
  autocmd CmdlineLeave * :setlocal number relativenumber
  " Turn off relativenumbers when leaving window
  autocmd WinLeave,FocusLost * :setlocal number norelativenumber
 " Turn on relativenumbers when entering window
  autocmd WinEnter,FocusGained * :setlocal number relativenumber
augroup END
"}}}
  
  " PACKAGES {{{
" Add matchit.vim to runtimepath and enable it
" This package allows "%" to match HTML/XML tags
packadd! matchit
"}}}

" PLUGINS {{{

" VIM-PLUG ---------------------- {{{
call plug#begin('~/.vim/plugged')

" Nerdcommenter
Plug 'preservim/nerdcommenter'
" ALE
Plug 'dense-analysis/ale'
" Emmet
Plug 'mattn/emmet-vim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Unimpaired bracket mappings
Plug 'tpope/vim-unimpaired'
" Fugitive (Git visualizer)
Plug 'tpope/vim-fugitive'
" Surround text with quotes, brackets, tags, etc.
Plug 'tpope/vim-surround'
" Auto-pairs and auto-indentation for brackets
Plug 'jiangmiao/auto-pairs'
" Code completion engine
Plug 'ycm-core/YouCompleteMe'
" Colorthemes
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()
" }}}

" ALE ---------------------- {{{
" Linting configuration
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css':['stylelint'],
\   'html':[''],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'sh': ['shellcheck']
\}

" Fixing configuration
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier', 'stylelint'],
\   'html': ['prettier'],
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
let g:airline_theme="catppuccin"
"}}}

" COLORSCHEMES ----------------- {{{
" colorscheme molokai
" colorscheme gruvbox
colorscheme catppuccin-mocha
"}}}

" EMMET ---- -------------------- {{{

" Change default leader key from <C-y>
let g:user_emmet_leader_key = '.'
"}}}

" NERDCOMMENTER ---------------------- {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
"}}}

"}}}
