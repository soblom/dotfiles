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
    opts = {
      preview = {
        modes = { "n", "no", "c", "i" },    -- Enable preview in normal, operator-pending, command, insert
        hybrid_modes = { "n" },              -- Unconceal current line in normal mode only
        linewise_hybrid_mode = true          -- Unconceal only the current line (not entire node)
      }
    }
  },
  {
    'brianhuster/live-preview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('livepreview.config').set({
        dynamic_root = true, -- Serve files from the file's directory instead of cwd
      })
    end,
    keys = {
      { '<leader>mp', '<cmd>LivePreview start<cr>', desc = 'Markdown Browser Preview' },
      { '<leader>mc', '<cmd>LivePreview close<cr>', desc = 'Close Markdown Preview' },
    },
  },
}
