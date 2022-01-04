"download vim plug if doesn't exist yet
if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('Unix') && $XDG_CONFIG_HOME==''
	let $XDG_CONFIG_HOME='$HOME/.config'
endif

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
Plug 'tweekmonster/startuptime.vim'

"gdb integration
Plug 'sakhnik/nvim-gdb', {'for': ['c', 'cpp']}

Plug 'tpope/vim-fireplace', {'for': 'clojure'}

"multi language syntax
"Plug 'sheerun/vim-polyglot'
"Python syntax - doesn't work when there's from x import *
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'luochen1990/rainbow'

"Prolog
Plug 'mndrix/prolog.vim', { 'for': 'prolog' }

"javascript autocomplete
Plug '1995eaton/vim-better-javascript-completion',
			\{'for': 'javascript'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'Shougo/echodoc.vim'

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

"Language Server Protocol
"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ }

"coc lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"deoplete
function! DoRemote(arg)
	UpdateRemotePlugins
endfunction
"Plug 'Shougo/deoplete.nvim' ", { 'do': function('DoRemote') }

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
"works well with floating windows
Plug 'morhetz/gruvbox'
"Plug 'iCyMind/NeoSolarized'

Plug 'jszakmeister/vim-togglecursor'

"syntax check"
"Plug 'w0rp/ale'

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

Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

" Add plugins to &runtimepath
call plug#end()

cnoremap \init<CR> e ~/vim/init.vim<CR>

source ~/vim/vim-nvim_vimrc

let g:ctrlp_working_path_mode = 'a'

"caps lock mapping
imap <Esc> <Plug>CapsLockToggle

"lint
highlight ALEWarning ctermbg=NONE
"language client
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['cquery', '--language-server', '--log-file=/tmp/cq.log'],
    \ 'c': ['cquery', '--language-server', '--log-file=/tmp/cq.log']
    \ }
" \'python' : ['pyls', '-v'],
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '/home/qi/.config/nvim/lssettings.json'
nnoremap <silent> H :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>u :call LanguageClient_textDocument_references() <bar> lopen <bar> nnoremap <buffer> q :lclose<lt>CR><CR>
"let g:LanguageClient_loadSettings = 1
let g:LanguageClient_diagnosticsDisplay = { 1: { "name": "Error", "signText": ">>" }, 2: { "name": "Warning", "signText": "--" }, 3: { "name": "Information", "signText": "i" }, 4: { "name": "Hint", "signText": ">" } }
set completeopt-=preview

"autocomplete
let g:snipMate = {}
let g:snipMate.overide = 1
let g:python3_host_prog = '/usr/bin/python3'
set omnifunc=syntaxcomplete#Complete
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_ignore_case = 1
"let g:deoplete#enable_smart_case = 1
"let g:deoplete#enable_refresh_always = 1
"let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
"call deoplete#custom#source('_', 'converter', 'converter_auto_paren')
set icm=nosplit
set shortmess+=c
"for echodoc
let g:echodoc_enable_at_startup = 1
set noshowmode

"latex
au BufWritePost *.tex :Latexmk
au BufReadPost *.tex :LatexView
au FileType tex :set conceallevel=2
au FileType tex :let g:tex_conceal="abdgm"

"clojure repl, try catch if repl not open
au BufWritePost *.clj,*.cljc :try | Require | catch | | endtry

"indentation
set formatexpr=LanguageClient_textDocument_rangeFormatting()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
EOF

"set termguicolors
set background=dark
colorscheme solarized
hi Pmenu ctermbg=236 ctermfg=yellow
hi PmenuSel ctermbg=24 ctermfg=yellow
hi Normal ctermbg=none
hi NonText ctermbg=none
hi Conceal ctermbg=none
au filetype python hi semshiSelected ctermbg=none ctermfg=190
let g:rainbow_active = 1 "ranbow parans

"buffer navigation
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
tnoremap <C-v> <C-\><C-n>pa

"escape terminal
tnoremap <esc> <C-\><C-n>
autocmd BufEnter term://*
      \ exec search('\S\_s*\%$','n')<=line('.')
      \ ? 'startinsert' : ''
"\_s = \s\n; \%$ = end of file; 'n' is don't move cursor
"line('.') = line at cursor
