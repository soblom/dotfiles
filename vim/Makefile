VIMHOME_SOURCE=$(wildcard vimhome/**/*)
VIMHOME_TARGET=$(subst vimhome,~/.vim,$(VIMHOME_SOURCE))

@PHONY=test
test:
	@echo $(VIMHOME_TARGET)
	@echo $(VIMHOME_SOURCE)

@PHONY=allconfig
allconfig: ~/.vimrc $(VIMHOME_TARGET)

~/.vimrc: vimrc
	cp vimrc $@
	vim +PlugInstall +qall

$(VIMHOME_TARGET): $(VIMHOME_SOURCE)
	cp -R $^ $@
	touch $@ # hack to avoid constant reruns

@PHONY=~/.vim/autoload/plug.vim:
~/.vim/autoload/plug.vim:
	curl -o $@ --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
