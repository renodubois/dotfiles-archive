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
" NOTE(reno): fzf is being really slow on my Mac,
" and I haven't been able to dig into why, but I'm
" gonna give Telescope a go and see if it's better.
" Plug 'junegunn/fzf' " fuzzy file finder
" Plug 'junegunn/fzf.vim' " fuzzy file finder
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter (also a dep for telescope)
Plug 'nvim-lua/plenary.nvim' " Dep for Telescope
Plug 'nvim-telescope/telescope.nvim' " Telescope (fuzzy file finder)
Plug 'neovim/nvim-lspconfig' " LSP config
Plug 'folke/lsp-colors.nvim' " LSP color stuff
" TODO: re-enable this when it supports neovim nightly
Plug 'tpope/vim-fugitive' " Git wrapper 
Plug 'vim-vdebug/vdebug' " Debugging
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Better Go support
" Plug 'ziglang/zig.vim' " Zig Support
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " VS:Code-like autocomplete
call plug#end()

" Bindings
" Ctrl-P file search
let mapleader = " " 
nnoremap <C-P> :Telescope find_files<CR>
nnoremap <C-F> :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
" TODO: Re-enable these whwn I turn fugutive back on
" nnoremap <leader>gs :Git status<CR>
" nnoremap <leader>gc :Git commit<CR>
" nnoremap <leader>gd :Git diff<CR>

" Commands
" Deletes buffer without closing split. (swaps to prev buffer, then deletes
" the just switched away from buffer (bd #))
command Bd bp\|bd \# 

" Debugging
let g:vdebug_options = { 'port':9000, 'path_maps': {'/vagrant/':getcwd()}, 'server': '' }

" fzf setup
" set rtp+=/opt/homebrew/opt/fzf

" Lua-based Config
lua << EOF
-- LSP Config
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
-- Treesitter config
--require'nvim-treesitter.configs'.setup {
--	ensure_installed = "maintained", -- All parsers that are actively maintained (turn this off if slow)
--	highlight = {
--		enable = true,
--		additional_vim_regex_highlighting = false -- Turn this off if it's too slow
--	},
--	-- Incremental Selection (not sure how this works, trying it out)
--	incremental_selection = {
--		enable = true,
--		keymaps = {
--			init_selection = "gnn",
--			node_incremental = "grn",
--			scope_incremental = "grc",
--			node_decremental = "grm"
--		}
--	}
--}
EOF

" Treesitter-based folding
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

" Enable Omnifunc for Go
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc

" enable $theme 
set termguicolors
set winblend=0
set wildoptions=pum
set pumblend=5
set background=dark
