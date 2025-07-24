local opt = vim.opt
opt.backspace      = { 'indent', 'eol', 'start' }
opt.cmdheight      = 0
opt.swapfile       = false
opt.timeoutlen     = 400
opt.shiftwidth     = 2
opt.tabstop        = 2
opt.expandtab      = true
opt.number         = true
opt.relativenumber = true
opt.cursorline     = true
opt.scrolloff      = 8
opt.fillchars:append { vert = '│' }
opt.list           = true
opt.listchars      = { nbsp='⦸', tab='▸‒', extends='⇝', precedes='⇜',
                       trail='▨', eol='⌝' }
opt.foldmethod     = 'expr'
opt.foldexpr       = 'v:lua.vim.treesitter.foldexpr()'
opt.foldenable     = false   -- ← keeps folds open on BufRead
opt.ignorecase     = true
opt.smartcase      = true
opt.incsearch      = true
opt.hlsearch       = true
opt.splitright     = true
opt.shortmess:append('I')
opt.splitbelow     = true
opt.diffopt:append 'vertical'
opt.shell        = '/bin/zsh'

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
