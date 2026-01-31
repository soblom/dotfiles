return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    enabled = false,
    dependencies = 'nvim-treesitter/nvim-treesitter',
    ft = 'markdown',
    opts = {},
  },
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
  },
  {
    'brianhuster/live-preview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- The plugin uses a global LivePreview table and the command is 'LivePreview'
      -- with subcommands like 'start' and 'close'.
    end,
    keys = {
      { '<leader>mp', '<cmd>LivePreview start<cr>', desc = 'Markdown Browser Preview' },
      { '<leader>mc', '<cmd>LivePreview close<cr>', desc = 'Close Markdown Preview' },
    },
  },
}
