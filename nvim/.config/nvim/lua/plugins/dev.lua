return {
  { 'MeanderingProgrammer/render-markdown.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    ft = 'markdown', opts = {} },
  { 'kristijanhusak/vim-dadbod-ui',
    dependencies = 'tpope/vim-dadbod',
    cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' } },
}
