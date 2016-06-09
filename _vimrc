set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=C:\Vim/vimfiles/bundle/Vundle.vim
call vundle#begin('C:\Vim/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"smooth scrolling
Plugin 'yonchu/accelerated-smooth-scroll'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
""Plugin 'user/L9', {'name': 'newL9'}

"clean windows graphics
Plugin 'kkoenig/wimproved.vim'

"snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
"Optional:
  Plugin 'honza/vim-snippets'

"file search
Plugin 'ctrlpvim/ctrlp.vim'

  "caps lock"
Plugin 'tpope/vim-capslock'

"syntax check"
Plugin 'scrooloose/syntastic'

"solarized
Plugin 'altercation/vim-colors-solarized'

"auto complete parens
Plugin 'jiangmiao/auto-pairs'

"add text object dependencies
Plugin 'kana/vim-textobj-user'
"text object for same indented lines
Plugin 'kana/vim-textobj-indent'
"text object for last paste text
Plugin 'saaguero/vim-textobj-pastedtext'
"make default text objects seek for adjacent when not in one
Plugin 'wellle/targets.vim'
"add function text object as 'f' 
Plugin 'kana/vim-textobj-function'
"commented text as text object
Plugin 'glts/vim-textobj-comment'
"toggle comments
Plugin 'scrooloose/nerdcommenter'
"<leader>cc for comment, <l>c<space> for collective toggle <l>ci to invert
"indivisual lines

"navigation through key-labeling
Plugin 'easymotion/vim-easymotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this lineet nocompatible

"improve windows graphics
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
:set guioptions-=L
:set guioptions-=r
:set guioptions-=T
:set guioptions-=m
autocmd GUIEnter * silent! WToggleClean
call togglebg#map("<F6>")

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
source ~\vim\vrapper_vimrc 
source ~\vim\vim-nvim_vimrc 
behave mswin

"initial syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

"set window size
set lines=53 columns=190
"initial height of syntastic window
let g:syntastic_loc_list_height=5
