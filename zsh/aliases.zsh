# Aliases
alias t="tmux"
alias rake="noglob rake" # necessary to make rake work inside of zsh
alias grdl="./gradlew"
alias iDrive="cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs"
alias ls="ls -lh"
alias vim='nvim'
alias aspell='TERM=ansi aspell'

mdp() {
  if [[ -z $1 ]]; then echo "error: please specify an input file!"; exit 1; fi
  echo "mdp: Rendering $1.."
  local outfile="${1%.*}.html"
  local themedir=$(realpath ~/.local/share/gh-theme)
  pandoc\
    -o "${outfile}"\
    -t html\
    -s --resource-path=$themedir\
    -H inline-style.html\
    -B begin-insert.html\
    -A end-insert.html\
    -c $themedir/gh.css\
    --embed-resources\
    -- $1
  echo mdp: Finished. Opening HTML.
  open $outfile
}

