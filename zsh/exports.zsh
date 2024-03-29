# Note: PATH modifications are done in the `zshrc` snippet
export MANPATH="$MANPATH:$HOME/.local/share/man"
export EDITOR="vim"
export GIT_EDITOR="vim"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export HOMEBREW_NO_ANALYTICS=1

# Only attempt to set JAVA_HOME if it is installed 
if ! /usr/libexec/java_home &> /dev/null; then
  JAVA_HOME="$(/usr/libexec/java_home)"
  export JAVA_HOME
fi


# https://www.gnupg.org/(it)/documentation/manuals/gnupg/Common-Problems.html
export GPG_TTY=$(TTY)
