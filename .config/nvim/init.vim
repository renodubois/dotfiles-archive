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
Plug 'junegunn/fzf' " fuzzy file finder
Plug 'junegunn/fzf.vim' " fuzzy file finder
Plug 'ludovicchabant/vim-gutentags' " ctags manager
Plug 'neovim/nvim-lspconfig' " LSP config
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'gruvbox-community/gruvbox' " Gruvbox color scheme
Plug 'vim-vdebug/vdebug' " Debugging
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Better Go support
call plug#end()

" Bindings
" Ctrl-P file search
let mapleader = " " 
nnoremap <C-P> :Files<CR>
nnoremap <C-F> :Ag<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gd :Git diff<CR>

" Debugging
let g:vdebug_options = { 'port':9001, 'path_maps': {'/vagrant/':'/Users/renodubois/lacrm/LessAnnoyingCRM/'}, 'server': '' }


" LSP things
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end
require'lspconfig'.tsserver.setup{}
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.intelephense.setup{}
require'lspconfig'.gopls.setup{
	cmd = {"gopls", "serve"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true
			},
			staticcheck = true
		}
	}
}
EOF

" Enable Omnifunc for Go
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc

" enable Gruvbox 
colorscheme gruvbox
