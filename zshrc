safe_source ()
{
	if [ -e "$1" ]
	then
		source "$1"
	fi
}

source $HOME/.config/env/exports
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

# # ex = Extractor for all kinds of archives
# # usage: ex <file>
ex ()
{
	if [ -f $1 ]
	then
		case $1 in
			*.tar.bz2)   	tar xjf $1   	;;
			*.tar.gz)    	tar xzf $1   	;;
			*.bz2)       	bunzip2 $1   	;;
			*.rar)       	unrar x $1   	;;
			*.gz)        	gunzip $1    	;;
			*.tar)       	tar xf $1    	;;
			*.tbz2)      	tar xjf $1   	;;
			*.tgz)       	tar xzf $1   	;;
			*.zip)       	parallel \
			unzip -d "{.}" "{}" ::: "$1"	;;
			*.Z)         	uncompress $1	;;
			*.7z)        	7z x $1      	;;
			*.deb)       	ar x $1      	;;
			*.lz)	  	lzip -d $1	;;
			*.tar.xz)    	tar xf $1    	;;
			*.tar.zst)   	tar xf $1    	;;
			*.tar.lz)	tar xf $1	;;
			*)		echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

ffv()
{
	if [ -f "$1" ]
	then
		case "$1" in
			*.png) png2ff < "$1" > /tmp/image.ff && lel /tmp/image.ff ;;
			*.PNG) png2ff < "$1" > /tmp/image.ff && lel /tmp/image.ff ;;
			*.jpg) jpg2ff < "$1" > /tmp/image.ff && lel /tmp/image.ff ;;
			*.JPG) jpg2ff < "$1" > /tmp/image.ff && lel /tmp/image.ff ;;
			*.ff) lel "$1" ;;
			*) echo "Can't convert that format." ''
		esac
	fi
	rm -f /tmp/image.ff
}

bookmark_extract()
{
	echo "hq a attr href > dest < source"
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
	remove_file $HOME/.calc_history
	remove_file $HOME/.wget-hsts
	remove_file $HOME/.xsession-errors.old
	remove_file $HOME/.sqlite_history
}

safe_source $HOME/.config/env/aliases
safe_source $HOME/.aliases

autoload -Uz compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion::complete:*' use-cache 1

clear && ufetch

unset MANPATH # Don't force it

