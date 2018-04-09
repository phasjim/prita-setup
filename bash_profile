#.bashrc

## Source stuff from .bash
for file in $(ls ${HOME}/.bash/*.sh);
  do source $file;
done

## Source stuff from engineering/.bash

## Shell stuff
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"

## Environment
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export DISPLAY=:0.0
export EDITOR='subl -w'
export PROMPT_COMMAND='prompt_function'

## GIT
prompt_function() {
  local        BLUE='\[\033[0;34m\]'
  local         RED='\[\033[0;31m\]'
  local   LIGHT_RED='\[\033[1;31m\]'
  local        CYAN='\[\033[0;36m\]'
  local LIGHT_GREEN='\[\033[1;32m\]'
  local      YELLOW='\[\033[0;33m\]'
  local       WHITE='\[\033[1;37m\]'
  local  LIGHT_GRAY='\[\033[0;37m\]'
  local        GRAY='\[\033[1;30m\]'
  local       RESET='\[\033[0m\]'
  local TITLE_START='\[\033]0;'
  local   TITLE_END='\007\]'
  local      PURPLE='\[\033[0;35m\]'

  if test $(git status 2> /dev/null | grep -c :) -eq 0; then
    git_color="${CYAN}"
  else
    git_color="${PURPLE}"
  fi

  #PS1="${RESET}\u@\h: \w${git_color}$(__git_ps1)${RESET}\$ "

  #PS1="${RESET}\u@\h:${git_color}$(__git_ps1)${RESET} \w\$ "

  PS1="${RESET}\u@\h:${git_color}$(__git_ps1)${RESET} \W \$ "
}

## Aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias slq='mysql'

## History
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on

## colors
export CLICOLOR=1
export LSCOLORS=gxcxhxahFeeghxfecgfxcx
## export LSCOLORS=dxfxcxdxbxegedabagacad

## functions
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)          tar xjf $1          ;;
      *.tar.gz)           tar xzf $1          ;;
      *.bz2)              bunzip2 $1          ;;
      *.rar)              unrar x $1          ;;
      *.gz)               gunzip $1           ;;
      *.tar)              tar xf $1           ;;
      *.tbz2)             tar xjf $1          ;;
      *.tgz)              tar xzf $1          ;;
      *.zip)              unzip $1            ;;
      *.Z)                uncompress $1       ;;
      *)                  echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

grab() {
  sudo chown -R ${USER} ${1:-.}
}

psgrep() {
  if [ ! -z $1 ] ; then
    echo "Grepping for processes matching $1..."
    ps aux | grep $1 | grep -v grep
  else
    echo "!! Need name to grep for"
  fi
}

fixlines () {
  /usr/bin/perl -pi~ -e 's/\r\n?/\n/g' "$@" ;
}
export PATH="/usr/local/opt/curl/bin:$PATH"
