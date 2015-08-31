source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/colors.zsh
source ~/dotfiles/zsh/setopt.zsh
source ~/dotfiles/zsh/exports.zsh
source ~/dotfiles/zsh/prompt.zsh
source ~/dotfiles/zsh/completions.zsh

if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

if which rbenv &> /dev/null; then
    # Put the rbenv entry at the front of the line
    export PATH="$HOME/.rbenv/bin:$PATH"

    # enable shims and auto-completion
    eval "$(rbenv init - zsh)"
fi
