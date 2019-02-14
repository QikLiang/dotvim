syntax enable
colorscheme desert
filetype plugin indent on
set nocompatible
set bs=indent,eol,start
set ai
set gdefault

inoremap jk <Esc>
inoremap jj <Esc>
inoremap kj <Esc>
inoremap kk <Esc>
inoremap ;; <esc>A;
inoremap {{ <esc>A{<cr>}<esc>O
autocmd FileType python inoremap :: <esc>A:
"buffer navigation
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-,> <C-W><
nnoremap <A-.> <C-W>>
nnoremap <A-=> <C-W>+
nnoremap <A--> <C-W>-

"use alt for mapping
set winaltkeys=no

"scroll
nmap <up> <C-Y>
nmap <down> <C-E>

set number
set relativenumber
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
