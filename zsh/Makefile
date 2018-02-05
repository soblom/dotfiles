# exports.zsh should always come first
snippets:= exports.zsh $(filter-out exports.zsh, $(wildcard *.zsh)) 
$(HOME)/.zshrc: exports.zsh $(snippets) zshrc
	printf %"s\n" "# DON'T CHANGE THIS FILE"\
	 							"# IT WAS AUTOMATICALLY CREATED FROM ~/dotfiles" \
		| cat - $^ > $@

