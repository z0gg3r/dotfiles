safe_source ()
{
	if [ -e "$1" ]
	then
		source "$1"
	fi
}

source $HOME/.config/env/exports
source $HOME/.config/scripts/exportfunctions.sh
export ZSH="$HOME/.config/oh-my-zsh"

ZSH_THEME="wezm"

CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=()

safe_source $ZSH/oh-my-zsh.sh
safe_source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh

setopt GLOB_DOTS
setopt COMPLETE_ALIASES
unsetopt AUTO_CD

[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

# Remove rouge aliases
unalias ls
unalias la
unalias ll
unalias l

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
	remove_file $HOME/.calc_history
	remove_file $HOME/.wget-hsts
	remove_file $HOME/.xsession-errors.old
	remove_file $HOME/.sqlite_history
}

safe_source $HOME/.config/env/aliases
safe_source $HOME/.aliases
safe_source "$HOME/.config/scripts/create_wayland_env.sh"

autoload -Uz compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion::complete:*' use-cache 1

clear && ufetch

unset MANPATH # Don't force it
