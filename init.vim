call plug#begin('$XDG_CONFIG_HOME\nvim\plugged')

"git
Plug 'tpope/vim-fugitive'

"smooth scrolling
Plug 'yonchu/accelerated-smooth-scroll'

"status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"deoplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim' ", { 'do': function('DoRemote') }

"snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
"Optional:
  Plug 'honza/vim-snippets'

"file search
Plug 'ctrlpvim/ctrlp.vim'

  "caps lock"
Plug 'tpope/vim-capslock'

"color scheme
Plug 'mhartington/oceanic-next'
Plug 'frankier/neovim-colors-solarized-truecolor-only'

"syntax check"
"Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'

"auto complete parens
Plug 'jiangmiao/auto-pairs'

"add text object dependencies
Plug 'kana/vim-textobj-user'
"text object for same indented lines
Plug 'kana/vim-textobj-indent'
"text object for last paste text
Plug 'saaguero/vim-textobj-pastedtext'
"make default text objects seek for adjacent when not in one
Plug 'wellle/targets.vim'
"add function text object as 'f' 
Plug 'kana/vim-textobj-function'
"commented text as text object
Plug 'glts/vim-textobj-comment'
"toggle comments
Plug 'scrooloose/nerdcommenter'
"<leader>cc for comment, <l>c<space> for collective toggle <l>ci to invert
"indivisual lines

"navigation through key-labeling
"Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'

" Add plugins to &runtimepath
call plug#end()

cnoremap \init<CR> e C:\Users\Qi\AppData\Local\nvim\init.vim<CR>

source ~\vim\_vimrc 

"use alt for mapping
set winaltkeys=no
"make file search easier
cd C:\Users\Qi\Desktop\programs
let g:ctrlp_working_path_mode = 'a'

""code folding
set foldmethod=syntax
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview
autocmd BufWinEnter *.java set foldnestmax=2 

"caps lock mapping
imap <Esc> <Plug>CapsLockToggle

"paste test test object keybinding
let g:pastedtext_select_key = 'P'

"Neomake
let g:neomake_open_list = 1
let g:neomake_list_height = 4

""initial syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1
""change directory to current file before saving
"cnoremap w<CR> lcd %:p:h<CR>:w

""initial height of syntastic window
"let g:syntastic_loc_list_height=5

"set window size
let g:GuiWindowMaximized = 1
set GuiWindowMaximized
"set lines=53 columns=190

"autocomplete 
imap <S-Enter> <c-n>
let g:deoplete#enable_at_startup = 1

"map leader to space
let mapleader = "\<Space>"

"search and replace
set gdefault

syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
nmap <silent> <F6> :let &background = ( &background == "dark"? "light" : "dark" )<CR> 
set background=dark
colorscheme solarized
":colorscheme OceanicNext<CR> 
"au VimEnter * :colorscheme OceanicNext<CR>

"buffer navigation
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
