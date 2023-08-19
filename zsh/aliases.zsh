# Aliases
alias t="tmux"
alias rake="noglob rake" # necessary to make rake work inside of zsh
alias grdl="./gradlew"
alias iDrive="cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs"
alias ls="ls -lh"
alias vim='nvim'

mdp() {
  if [[ -z $1 ]]; then echo "error: please specify an input file!"; exit 1; fi
	echo "mdp: Rendering $1.."
  local tempfile
  tempfile="$(mktemp -t mdp_out_)"
	pandoc -o "${tempfile}" -t html --metadata title="$1" -s -c ~/.gh.css "$1"
	sed -i "" 's/\<body\>/\<body class=\"markdown-body\"\>/' "$tempfile"
	echo mdp: Finished. Opening HTML.
  mv "$tempfile" "${tempfile}.html"
	open "${tempfile}.html"
}

