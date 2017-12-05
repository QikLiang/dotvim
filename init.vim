"download vim plug if doesn't exist yet
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('Unix') && $XDG_CONFIG_HOME==''
	let $XDG_CONFIG_HOME='~/.config'
endif

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

"multi language syntax
Plug 'sheerun/vim-polyglot'

"Prolog
Plug 'mndrix/prolog.vim', { 'for': 'prolog' }

"java autocomplete
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}

"javascript autocomplete
Plug '1995eaton/vim-better-javascript-completion',
			\{'for': 'javascript'}

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"smooth scrolling
Plug 'yonchu/accelerated-smooth-scroll'

"status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"start page
Plug 'mhinz/vim-startify'

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
"Plug 'mhartington/oceanic-next'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
"Plug 'iCyMind/NeoSolarized'

Plug 'jszakmeister/vim-togglecursor'

"syntax check"
"Plug 'scrooloose/syntastic'
"Plug 'benekastah/neomake'
Plug 'w0rp/ale'

"auto complete parens
Plug 'jiangmiao/auto-pairs'

"auto detect indent
Plug 'tpope/vim-sleuth'

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

"disable linter for MIPS
let g:ale_linters = {'asm': []}

cnoremap \init<CR> e ~/vim/init.vim<CR>

source ~/vim/vim-nvim_vimrc

let g:ctrlp_working_path_mode = 'a'

"caps lock mapping
imap <Esc> <Plug>CapsLockToggle

"Neomake
"let g:neomake_open_list = 1
"let g:neomake_list_height = 4
"let g:neomake_java_javac_classpath = '.'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

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

"autocomplete
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/usr/bin/python3'
set omnifunc=syntaxcomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#omni#input_patterns.java = [
			\'[^. \t0-9]\.\w*',
			\'[^. \t0-9]\->\w*',
			\'[^. \t0-9]\::\w*',
			\]
set icm=nosplit

""initia of syntastic window
"let g:syntastic_loc_list_height=5

"set window size
"let g:GuiWindowMaximized = 1
"set GuiWindowMaximized
"set lines=53 columns=190

"set termguicolors
nmap <silent> <F6> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
set background=dark
colorscheme solarized
hi Normal ctermbg=none
highlight NonText ctermbg=none

"buffer navigation
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"escape terminal
tnoremap <esc> <C-\><C-n>
autocmd BufEnter term://* startinsert

"neomake shortcut
"autocmd! BufWritePost *.java <Plug>(JavaComplete-Imports-Add)
"call neomake#configure#automake('w')
"autocmd! BufWritePost * :Neomake!
"cnoremap lc lclose<cr>
