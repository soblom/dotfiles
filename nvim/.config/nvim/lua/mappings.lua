local map = vim.keymap.set

-- buffer cycling
map('n', '<leader>b', ':bn<CR>', { silent = true, desc = 'Next buffer' })
map('n', '<leader>B', ':bp<CR>', { silent = true, desc = 'Prev buffer' })

-- insert-mode jk/jj escapes
map('i', 'jj', '<Esc>')

-- disable arrow keys (n + i)
for _, mode in ipairs({ 'n', 'i' }) do
  for _, key in ipairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
    map(mode, key, '<NOP>')
  end
end
