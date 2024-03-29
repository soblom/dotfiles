-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true


vim.g.mapleader = ","
vim.api.nvim_set_keymap("n", '<leader>e', ":NvimTreeToggle<cr>", { noremap=true, silent=true})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- coq settings should come before lazy.setup
-- https://github.com/ms-jpq/coq_nvim/issues/403#issuecomment-1584999754
vim.g.coq_settings = {
  auto_start = 'shut-up',
  display = { icons = { mode = 'none' } }
}

require("lazy").setup({
  "vim-airline/vim-airline",
  {
    "tpope/vim-fugitive",
    cmd = {
      "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Gedit", "Gsplit",
      "Gread", "Gwrite", "Ggrep", "Glgrep", "Gmove",
      "Gdelete", "Gremove", "Gbrowse",
    },
  },
  {"tpope/vim-surround"},
  {"folke/trouble.nvim"},
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  "neovim/nvim-lspconfig",
  "ms-jpq/coq_nvim",
  "ms-jpq/coq.artifacts",
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    config = function()
      require("nvim-tree").setup {
        renderer = {
          icons = {
            show = {
              file = false,    -- disables file icons
              folder = false,  -- disables folder icons
              folder_arrow = false, -- disables the folder arrow icon
            }
          }
        },
        view = {
          width = 40,
        },
      }
    end,
  }
})

require'lspconfig'.pyright.setup{
    on_attach = my_custom_on_attach,
    settings = {
        python = {
            analysis = {
                logLevel = "Trace",
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    }
}


local lspconfig = require('lspconfig')

local servers = { 'tsserver', 'pyright', 'bashls', 'cucumber_language_server' }
-- LSP setup
for _,lsp in ipairs(servers) do
  lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({
    -- on_attach = my_custom_on_attach,
  }))
end

vim.opt.runtimepath:prepend("~/.vim/pack/default/start/gruvbox")
vim.cmd("source ~/.vim/vimrc_shared")

vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=250, on_visual=true})
  augroup END
]], false)
