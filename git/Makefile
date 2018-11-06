GITCONFIG_DIR := $(HOME)/.config/git

all: $(GITCONFIG_DIR) global_config

$(GITCONFIG_DIR)/ignore: gitignore | $(GITCONFIG_DIR)
	cp $^ $@
	core.excludesfile=$@

$(GITCONFIG_DIR):
	mkdir -p $(GITCONFIG_DIR)

.PHONY=global_config
global_config:
	git config --global diff.tool vimdiff
