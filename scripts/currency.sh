#!/bin/sh
# shellcheck disable=SC2140

die()
{
	printf '%b\n' "$@"
	exit 1
}

amount="$1"
currency="$2"

[ -z "$amount" ] && die "Must set amount"
[ -z "$currency" ] && die "Must set currency"

uri="https://currency.world/${amount}_${currency}"

curl -s "${uri}" | grep 'formatted_amounts=\[' | replace 'formatted_amounts=['  '' | replace ']' ''  | replace '"' ''  | cut -d, -f2
