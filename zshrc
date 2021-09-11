# All non-zsh exports go in there!
source /home/zocki/.config/env/exports
export ZSH=/usr/share/oh-my-zsh/
# source /home/zocki/.config/scripts/tmux.sh

ZSH_THEME="wezm"

CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt GLOB_DOTS
setopt COMPLETE_ALIASES

[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

# Remove rouge aliases
unalias ls
unalias la
unalias ll
unalias l
# unalias l.

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

remove_file()
{
	if [ -e "$1" ]
	then
		rm "$1"
	fi
}

# Removing useless files
remove_files()
{
	remove_file /home/zocki/.lesshst
	remove_file /home/zocki/.calc_history
	remove_file /home/zocki/.wget-hsts
	remove_file /home/zocki/.xsession-errors.old
	remove_file /home/zocki/.sqlite_history
}

source /home/zocki/.config/env/aliases

autoload -Uz compinit
compinit

clear && neofetch
