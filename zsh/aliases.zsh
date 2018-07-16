
alias zshconf="$EDITOR ~/.zshrc"
alias dotconf="$EDITOR ~/dotfiles"
alias t="tmux"
alias rake="noglob rake" # necessary to make rake work inside of zsh

mdp() {
	echo mdp: Rendering $1...
	pandoc -o /tmp/out.html -s -c ~/.gh.css $1
	sed -i "" 's/\<body\>/\<body class=\"markdown-body\"\>/' /tmp/out.html
	echo mdp: Finished. Opening html.
	open /tmp/out.html
}

NV() {
	cd ~/Desktop/notes
	vim `fzf --preview="cat {}" --preview-window=right:70%:wrap`
}
