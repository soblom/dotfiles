return {
  {
    'nvim-telescope/telescope.nvim',
    version = false,
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Find files' },
      {
        '<leader>fa',
        function ()
          require("telescope.builtin").find_files({ no_ignore = true, hidden = true })
        end,
        desc = 'Find files'
      },
      { '<leader>fg', '<cmd>Telescope live_grep<CR>',  desc = 'Live grep' },
      { '<leader>fb', '<cmd>Telescope buffers<CR>',    desc = 'Buffers'    },
      { '<leader>fh', '<cmd>Telescope help_tags<CR>',  desc = 'Help tags'  },
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "%.git",
          "%.lock",
        },
      },
    },
  }
}
