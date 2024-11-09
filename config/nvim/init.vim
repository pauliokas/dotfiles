syntax on
set background=dark

set number
set scrolloff=5
set laststatus=2
set title
set showcmd

set smartindent
set smarttab
set backspace=indent,eol,start

set hlsearch
set incsearch

set nocompatible
filetype plugin on
set modeline
set modelines=5

set mouse=a
set updatetime=100
set statusline=%f%m%r%h%w%=%y[%l,%v][%p%%]

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
"let g:netrw_altv = 1
let g:netrw_winsize = 25

noremap <Leader>q :nohlsearch<CR>

packloadall
silent! helptags ALL

set clipboard+=unnamedplus

noremap <M-Up> :move -2<CR>
noremap <M-Down> :move +1<CR>

