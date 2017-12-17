install: ~/.zshrc ~/.vimrc

~/.zshrc:
	ln -s $(realpath zsh/zshrc) $@

~/.vimrc:
	ln -s $(realpath vim/vimrc) $@
