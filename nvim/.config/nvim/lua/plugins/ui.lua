return {
  { 'ellisonleao/gruvbox.nvim',          priority = 1000 },
  { 'norcalli/nvim-colorizer.lua',       opts = { '*' } },
  { 'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = { options = { theme = 'gruvbox' } } },
  { 'folke/noice.nvim', event = 'VeryLazy', opts = {},
    dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' } },
  { 'folke/trouble.nvim', cmd = 'TroubleToggle' },
}
