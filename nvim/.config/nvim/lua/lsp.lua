local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, { buffer = bufnr }) end
  map('n', 'K', vim.lsp.buf.hover)
  map('n', 'gd', vim.lsp.buf.definition)
end

local caps = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'pyright', 'ts_ls', 'bashls', 'cucumber_language_server' },
  handlers = {
    function(server)
      require('lspconfig')[server].setup { capabilities = caps, on_attach = on_attach }
    end,
    pyright = function()
      require('lspconfig').pyright.setup {
        capabilities = caps,
        on_attach = on_attach,
        settings = { python = { analysis = { autoSearchPaths = true } } },
      }
    end,
  },
}
