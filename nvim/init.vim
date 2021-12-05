set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=250, on_visual=true}
