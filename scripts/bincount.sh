#!/bin/sh

get_bin_cnt()
{
	[ -e "$1" ] && find "$1" | wc -l
}

bin="$(get_bin_cnt "/bin")"
sbin="$(get_bin_cnt "/sbin")"
usr_bin="$(get_bin_cnt "/usr/bin")"
usr_sbin="$(get_bin_cnt "/usr/sbin")"
local_bin="$(get_bin_cnt "/usr/local/bin")"
home_bin="$(get_bin_cnt "$HOME/.local/bin")"
script_bin="$(get_bin_cnt "$HOME/.local/scripts")"

dc_args="$bin $sbin $usr_bin $usr_sbin $local_bin $home_bin $script_bin ++++++ pq"

total="$(echo "$dc_args" | dc)"

echo "/bin: $bin"
echo "/usr/bin: $usr_bin"
echo "/usr/local/bin: $local_bin"
echo "$HOME/.local/bin: $home_bin"
echo "$HOME/.local/scripts: $script_bin"
echo "/sbin: $sbin"
echo "/usr/sbin: $usr_sbin"
echo "total: $total"
