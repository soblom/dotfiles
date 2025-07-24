-- some options that need to be set early
vim.loader.enable()
vim.opt.termguicolors  = true
vim.g.mapleader = ','

require('lazy_conf')
require('options')              -- core settings
require('mappings')             -- keymaps
require('lsp')                  -- LSP/Mason/cmp

vim.cmd.colorscheme('gruvbox')  -- after plugins
