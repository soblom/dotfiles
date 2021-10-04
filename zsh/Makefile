# exports.zsh should always come first
snippets:= exports.zsh $(filter-out exports.zsh local.zsh, $(wildcard *.zsh)) 
$(HOME)/.zshrc: $(snippets) zshrc exports.zsh local.zsh
	@echo "# DON'T CHANGE THIS FILE\n\
# IT WAS AUTOMATICALLY CREATED FROM ~/dotfiles" \
		| cat - $^ > $@

local.zsh:
	touch $@

