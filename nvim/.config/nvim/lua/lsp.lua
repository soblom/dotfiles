-- Modern LSP setup using LspAttach autocmd (Neovim 0.10+)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', function() require('snacks').picker.lsp_definitions() end, opts)
    vim.keymap.set('n', 'gD', function() require('snacks').picker.lsp_declarations() end, opts)
    vim.keymap.set('n', 'gi', function() require('snacks').picker.lsp_implementations() end, opts)
    vim.keymap.set('n', 'gr', function() require('snacks').picker.lsp_references() end, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- LSP capabilities with native snippet support (Neovim 0.10+)
local caps = vim.lsp.protocol.make_client_capabilities()
caps.textDocument.completion.completionItem.snippetSupport = true

-- If blink.cmp is available, use its capabilities
local has_blink, blink = pcall(require, 'blink.cmp')
if has_blink then
  caps = vim.tbl_deep_extend('force', caps, blink.get_lsp_capabilities())
end

require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'pyright', 'ts_ls', 'bashls', 'cucumber_language_server', 'tinymist' },
  handlers = {
    function(server)
      require('lspconfig')[server].setup { capabilities = caps }
    end,
    pyright = function()
      require('lspconfig').pyright.setup {
        capabilities = caps,
        settings = { python = { analysis = { autoSearchPaths = true } } },
      }
    end,
    tinymist = function()
      require('lspconfig').tinymist.setup {
        capabilities = caps,
        settings = {
          exportPdfs = 'onSave',
        },
      }
    end,
  },
}
