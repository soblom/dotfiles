#!/usr/bin/env bash
# vim: set ft=bash:

# Visual Studio Code
# ln -s "~/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code" "${HOME}/.local/bin"

_stow_app() { stow -t "$HOME" "$1" ;}

base() {
  brew install stow
}

vim() {
  _stow_app vim
}

nvim() {
  _stow_app nvim
}

main() {
  if [[ -z $1 ]]; then
    echo "Need to specifiy one or more apps to configure
Usage: $0 <app>"
    exit 1
  fi

  case $1 in
    vim)
      vim;;
    nvim)
      nvim;;
    *)
      echo "this should never run"; exit 1;;
  esac
}

main "$@"
