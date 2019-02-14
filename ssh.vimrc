syntax enable
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
autocmd FileType python inoremap :: <esc>A:
set number
set relativenumber
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
