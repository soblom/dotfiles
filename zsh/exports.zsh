# Note: PATH modifications are done in the `zshrc` snippet
export EDITOR="vim"
export GIT_EDITOR="vim"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Only attempt to set JAVA_HOME if it is installed 
if [ ! /usr/libexec/java_home &> /dev/null ]; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi
