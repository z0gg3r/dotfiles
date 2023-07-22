safe_source ()
{
	if [ -e "$1" ]
	then
		source "$1"
	fi
}

source $HOME/.config/env/exports
source $HOME/.local/scripts/exportfunctions.sh
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

safe_source $HOME/.config/env/aliases
safe_source $HOME/.aliases

if [ -f /etc/os-release ]
then
	os="$(grep ^ID /etc/os-release | cut -d= -f2)"
else
	os="gentoo"
fi

case $os in
	"*arch*") safe_source $HOME/.config/env/arch-aliases ;;
	"*artix*") safe_source $HOME/config/env/arch-aliases ;;
	"*void*") safe_source $HOME/.config/env/void-aliases ;;
	*) safe_source $HOME/.config/env/gentoo-aliases ;;
esac

autoload -Uz compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion::complete:*' use-cache 1

clear && ufetch

unset MANPATH # Don't force it
