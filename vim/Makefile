~/.vimrc: ~/.vim/autoload/plug.vim vimrc 
	cp vimrc $@
	vim +PlugInstall +qall

~/.vim/autoload/plug.vim:
	curl -o $@ --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
