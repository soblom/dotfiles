makefiles = $(wildcard */Makefile)
makedirs = $(makefiles:/Makefile=)

packages = zsh zsh-completions fzf pandoc tmux
# Targets are the brew folders in the standard location.
brews = $(foreach p,$(packages),/usr/local/Cellar/$(p))

.PHONY: all $(makedirs)

all: $(makedirs) $(brews)

$(makedirs):
	$(MAKE) -C $@

$(brews):
	brew install $(notdir $@)

test:
	@echo "The following dirs have makefiles in them:"
	@echo $(makedirs)	
