# exports.zsh should always come first
snippets:= exports.zsh $(filter-out exports.zsh local.zsh, $(wildcard *.zsh)) 
$(HOME)/.zshrc: $(snippets) zshrc exports.zsh local.zsh
	printf %"s\n" "# DON'T CHANGE THIS FILE"\
	 							"# IT WAS AUTOMATICALLY CREATED FROM ~/dotfiles" \
		| cat - $^ > $@

local.zsh:
	touch $@

