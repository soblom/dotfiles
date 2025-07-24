return {
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim', dependencies = 'williamboman/mason.nvim' },
  { 'neovim/nvim-lspconfig' },

  -- completion
  { 'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp     = require('cmp')
      local luasnip = require('luasnip')
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup {
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert {
          ['<Tab>']   = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<CR>']    = cmp.mapping.confirm { select = true },
        },
        sources = {
          { name = 'nvim_lsp' }, { name = 'luasnip' }, { name = 'path' },
        },
      }
    end
  },
}
