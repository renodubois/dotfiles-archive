" Init plugins via vim-plug
call plug#begin('~/.local/share/nvim/plugged')
" Plugins go here
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " NERDTree, on demand when it's toggled
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' } " NERDTree Git status icons (edited, untracked, etc.)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } " IDE-like completion
" fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Lang plugins
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'elmcast/elm-vim'
" colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Don't try to be vi compatible
set nocompatible

" don't use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" really, just don't
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

let mapleader="\<SPACE>"

" NERDTree Config
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>
" Close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1

" YCM Config
" disable auto_triggering ycm suggestions pane and instead
" use semantic completion only on Ctrl+n
let ycm_trigger_key = '<C-n>'
let g:ycm_auto_trigger = 0
let g:ycm_key_invoke_completion = ycm_trigger_key
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \} 

" this is some arcane magic to allow cycling through the YCM options
" with the same key that opened it.
" See http://vim.wikia.com/wiki/Improve_completion_popup_menu for more info.
let g:ycm_key_list_select_completion = ['<TAB>', '<C-j>']
inoremap <expr> ycm_trigger_key pumvisible() ? "<C-j>" : ycm_trigger_key;

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Bind fzf
nnoremap <C-P> :Files<CR>

" Turn on syntax highlighting
syntax on
color dracula

" For plugins to load correctly
filetype plugin indent on

" Syntastic Settings
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_javascript_checkers = ['tslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Disable polyglot elm plugin
let g:polyglot_disabled = ['elm']

" TODO: Pick a leader key
let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
"set formatoptions=tcqrn1
set shiftwidth=4
set autoindent
set noexpandtab
set tabstop=4
set nowrap

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" moving lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Textmate holdouts

" Formatting
map <leader>q gqip

" Add italics
highlight Comment cterm=italic

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL
