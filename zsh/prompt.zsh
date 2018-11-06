function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

export BOX_NAME=""
function box_name {
    if [ "$BOX_NAME" = "" ]; then
        if [ $(uname) = Darwin ]; then
            BOX_NAME="$(scutil --get ComputerName)"
        else
            BOX_NAME="$(hostname -s)"
        fi
    fi
	  echo $BOX_NAME
}

# http://blog.joshdick.net/2012/12/30/my_git_prompt_for_zsh.html
# copied from https://gist.github.com/4415470
# Adapted from code found at <https://gist.github.com/1712320>.

#setopt promptsubst
autoload -U colors && colors # Enable colors in prompt

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
GIT_PROMPT_PREFIX="%{$fg[green]%} ["
GIT_PROMPT_SUFFIX="%{$fg[green]%}]"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}u"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}d"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}s"

# Show Git branch/tag, or name-rev if on detached head
function parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
function parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi

}


# If inside a Git repository, print its branch and state
function git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "${git_where#(refs/heads/|tags/)}$(parse_git_state)"
}

function current_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

PROMPT_SEPARATOR='%{%B%}%{%F{202}%}▶%{%F{220}%}▶%{%F{190}%}▶'

PROMPT='
%{%f%k%b%}%
%{%B%F{248}%}%n@$(box_name)%
%{%F{245}%}%b in %{%B%F{172}%}$(current_pwd)
%{%F{072}%}$(prompt_char) ${PROMPT_SEPARATOR} %{%f%k%b%}'

RPROMPT='%{%B%F{109}%}$(git_prompt_string) %E%{%f%k%b%}'

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "
