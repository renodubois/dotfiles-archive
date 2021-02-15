" default options
" from Prime's video
set exrc " executes vim directory in pwd if it exists
set relativenumber " relative line numbers
set nu " current line shows line number
set nohlsearch " no highlight on search so you don't have to type :noh every time
set hidden " buffers can go into the bg without being saved (!!)
set noerrorbells " ding ding ding
set tabstop=4 " 4 space tabs
set shiftwidth=4 " if using spaces, use 4 per tab
filetype plugin indent on " from old vimrc : indentation detection
set nowrap " Disallow wrapping
set noswapfile " eff em
set nobackup " TODO: look this up
set undodir=~/.vim/undodir
set undofile " TODO: look this up (works w/ Undo Tree)
set incsearch " highlights as you search
set scrolloff=8 " Starts scrolling 8 lines below the bottom of the screen
set signcolumn=yes " Extra column for linting/errors, etc

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim' " dep for telescope
Plug 'nvim-lua/plenary.nvim' " dep for telescope
Plug 'nvim-telescope/telescope.nvim' " file finder, etc
Plug 'neovim/nvim-lspconfig' " LSP config
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'gruvbox-community/gruvbox' " Gruvbox color scheme
call plug#end()

" Bindings
" Ctrl-P file search
let mapleader = " " 
nnoremap <C-P> :Telescope find_files<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gd :Git diff<CR>

" LSP things
lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.jedi_language_server.setup{}
EOF

" enable Gruvbox 
colorscheme gruvbox
