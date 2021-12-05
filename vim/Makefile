VIMHOME_TARGET=~/.vim
PACKAGE_TARGET_DIR=$(VIMHOME_TARGET)/pack
PACKAGE_SOURCE_DIR=pack
PACKAGE_SOURCE_LIST=$(wildcard pack/**/_pluglist)
PACKAGE_TARGET_LIST=$(addprefix $(VIMHOME_TARGET)/, $(PACKAGE_SOURCE_LIST))

.PHONY: all
all: $(VIMHOME_TARGET)/vimrc $(PACKAGE_TARGET_LIST)

$(VIMHOME_TARGET):
	mkdir $@

$(VIMHOME_TARGET)/vimrc: vimrc | $(VIMHOME_TARGET)
	@cp vimrc $@

$(PACKAGE_TARGET_DIR)/%/_pluglist: pack/%/_pluglist
	mkdir -p $(dir $@)
	cp $^ $@
	cd $(dir $@) &&\
 awk '!/^#/ {printf "clone https://github.com/%s/%s %s/%s\n", $$1,$$2,$$3,$$2}' ~/dotfiles/vim/pack/base/_pluglist |\
 xargs -n3 git
