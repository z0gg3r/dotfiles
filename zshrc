[[ $- != *i* ]] && return

# Remove rouge aliases
unalias -a

safe_source ()
{
	if [ -e "$1" ]
	then
		source "$1"
	fi
}

git_prompt_info()
{
	if [ -e .git ]
	then
		branch="$(git --no-pager branch | grep '^*' | cut -d' ' -f2)"
		dirty="$(git status --porcelain)"
		if [ -z "$dirty" ]
		then
			printf '%b(%b) ' "%{$fg[yellow]%}" "$branch"
		else
			printf '%b(%b)%b ' "%{$fg[yellow]%}" "$branch" "⚡"
		fi
	fi
}

source $HOME/.config/env/exports
source $HOME/.local/scripts/exportfunctions.sh

export HISTFILE="$HOME/.cache/zsh-history"
export HISTSIZE="4096"
export SAVEHIST="$HISTSIZE"

setopt GLOB_DOTS
setopt NUMERIC_GLOB_SORT
setopt MARK_DIRS
setopt COMPLETE_ALIASES
setopt PROMPT_SUBST
setopt TRANSIENT_RPROMPT
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY_TIME
unsetopt AUTO_CD

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

safe_source $HOME/.config/env/aliases
safe_source $HOME/.aliases
safe_source $HOME/.config/env/gentoo-aliases

autoload -U colors && colors

export PROMPT='$(git_prompt_info)%(?..%{$fg[red]%}[%?]%{$reset_color%} )%{$reset_color%}%# '
export RPROMPT='%~'

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit

clear && ufetch

unset MANPATH # Don't force it
safe_source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
