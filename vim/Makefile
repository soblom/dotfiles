VIMHOME_SOURCE=vimhome
VIMHOME_TARGET=~/.vim
VIMPLUG_LOCAL=vimhome/autoload/plug.vim

.PHONY: allconfig clean

allconfig: ~/.vimrc $(VIMHOME_TARGET)

~/.vimrc: vimrc
	@cp vimrc $@
	@vim +PlugInstall +qall

VIMPLUG_LOCAL:
	curl -o $@ --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$(VIMHOME_TARGET): $(VIMHOME_SOURCE)
	rsync --recursive $(VIMHOME_SOURCE)/* $(VIMHOME_TARGET)

clean: $(VIMPLUG_LOCAL)
	rm $^
