return {
  { 'tpope/vim-fugitive', cmd = { 'Git', 'G' } },
  { 'kylechui/nvim-surround', event = 'InsertEnter', config = true },
  
  -- mini.nvim modules - lightweight and powerful
  { 'echasnovski/mini.pairs', version = false, config = true, event = 'InsertEnter' },
  { 'echasnovski/mini.ai', version = false, config = true, event = 'VeryLazy' },
  { 'echasnovski/mini.comment', version = false, config = true, event = 'VeryLazy' },
  { 'echasnovski/mini.icons', version = false, config = true, lazy = true },
  
  -- Quality of life improvements
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { ']t', function() require('todo-comments').jump_next() end, desc = 'Next todo comment' },
      { '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous todo comment' },
      { '<leader>ft', '<cmd>TodoTelescope<cr>', desc = 'Find todos' },
    },
  },
  {
    'luukvbaal/statuscol.nvim',
    event = 'VeryLazy',
    config = function()
      local builtin = require('statuscol.builtin')
      require('statuscol').setup({
        relculright = true,
        segments = {
          { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
          { text = { '%s' }, click = 'v:lua.ScSa' },
          { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
        },
      })
    end,
  },
}
