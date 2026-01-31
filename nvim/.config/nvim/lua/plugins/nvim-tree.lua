return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = { { '<leader>e', function() require('nvim-tree.api').tree.toggle() end,
               desc = 'Explorer' } },
    opts = {
      view = { width = 40 },
      renderer = {
        icons = {
          glyphs = {
            git = {
              unstaged = "●",  -- Filled dot instead of ✗
            },
          },
        },
      },
    },
  },
}
