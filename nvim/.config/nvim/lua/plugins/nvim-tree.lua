return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = { { '<leader>e', function() require('nvim-tree.api').tree.toggle() end,
               desc = 'Explorer' } },
    opts = {
      renderer = { icons = { show = { file=false, folder=false, folder_arrow=false } } },
      view = { width = 40 },
    },
  },
}
