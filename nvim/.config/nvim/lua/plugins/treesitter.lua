return {
  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        -- Required by noice.nvim
        'regex',
        'bash',
        -- Good to have for general development
        'lua', 'vim', 'vimdoc', 'query',
        'python', 'javascript', 'typescript', 'json', 'yaml',
        'markdown', 'markdown_inline',
        'typst',
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
