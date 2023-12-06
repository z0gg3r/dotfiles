#!/bin/sh

get_neomutt_version()
{
	neomutt -v | sed 1q
}

get_vim_version()
{
	vim --version | sed 1q | cut -d'(' -f1 | sed 's/ $//g'
}

get_msmtp_version()
{
	msmtp --version | sed 1q | sed 's/ version//g'
}

printf '%b; %b; %b\n' "$(get_neomutt_version)" "$(get_vim_version)" "$(get_msmtp_version)"
