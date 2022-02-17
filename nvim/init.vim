set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=250, on_visual=true}

nnoremap <leader>ff <cmd>lua require'telescope.builtin'.find_files()<CR>
nnoremap <leader>b <cmd>lua require'telescope.builtin'.buffers()<CR>
nnoremap <leader>rg <cmd>lua require'telescope.builtin'.live_grep()<CR>
