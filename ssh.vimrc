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

"remove auto comment
set fo-=rco

"set split buffer direction
set splitbelow
set splitright

"indent
autocmd FileType *          set tabstop=4 shiftwidth=4
autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab
autocmd FileType java       set tabstop=4 shiftwidth=4
autocmd FileType cpp        set tabstop=4 shiftwidth=4
autocmd FileType c          set tabstop=4 shiftwidth=4
autocmd FileType python     set tabstop=4 shiftwidth=4 expandtab

"autocomplete
imap <A-j> <c-n>
imap <A-k> <c-p>

set number
set relativenumber
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
