GITCONFIG_DIR := $(HOME)/.config/git
GLOBAL_CONF=git config --global

all: $(GITCONFIG_DIR)/ignore all_global

$(GITCONFIG_DIR)/ignore: gitignore | $(GITCONFIG_DIR)
	cp $^ $@
	$(GLOBAL_CONF) core.excludesFile=$@

$(GITCONFIG_DIR):
	mkdir -p $(GITCONFIG_DIR)

.PHONY: all-global diff_config merge_config
all_global: diff_config merge_config
	$(GLOBAL_CONFIG) pull.ff only

diff_config:
	$(GLOBAL_CONF) diff.tool vimdiff

merge_config:
	$(GLOBAL_CONF) merge.tool nvim
	$(GLOBAL_CONF) mergetool.nvim.cmd "nvim -f -c \"Gdiffsplit!\" \"\$$MERGED\""
	$(GLOBAL_CONF) mergetool.prompt false
