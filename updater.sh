#! /bin/sh
#   SPDX-FileCopyrightText: 2021 zocker <zocker@10zen.eu>
#   SPDX-License-Identifier: GPL-3.0-or-later
#
#   update.sh - A simple shell script to update a dotfiles repo
#   Copyright (C) 2021  zockerfreunde03/z0gg3r
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License Version 3 or
#   later as published by the Free Software Foundation.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License or the LICENSE file for more details.
#
#   You should have received a copy of the GNU General Public License along
#   with this program; if not, write to the Free Software Foundation, Inc.,
#   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

UPTODATE="\033[32;48m"
CHANGE="\033[33;38m"
ERROR="\033[31;48m"
INFO="\033[35;48m"
IGNORE="\033[34;48m"
END="\033[0m"

echo "$INFO Assuming echo does not need -e for colour output! $END"

die()
{
	echo "$ERROR $1 $END"
	exit 1
}

_diff()
{
	diff "$1" "$2" > /dev/null
}

# Args
# $1 = Path to dir
# $2 = Files to ignore
# $3 = Custom location
update_dir()
{
	dir_path=$1
	count=$(echo "$dir_path" | sed -e 's/\(.\)/\1\n/g' | grep -c "/")
	count=$(echo "$count 1 +pq" | dc)
	dir=$(echo "$dir_path" | cut -d/ -f"$count")
	if [ -n "$3" ]
	then
		dir="$3"
	fi
	ignore_list=$2
	if ! [ -e "$dir_path" ]
	then
		die "$dir_path does not exist!"
	fi
	echo "$INFO Updating $dir_path... $END"
	if ! [ -e "$dir" ]
	then
		mkdir "$dir"
	fi
	#for file in $($(which ls) "$dir_path")
	for prefixed_file in "$dir_path"/*
	do
		file="$(echo "$prefixed_file" | replace "$dir_path/" "")"
		case $ignore_list in
			*$file*) ignore="yes" ;;
		esac
		if [ -z "$ignore" ] && [ -d "$dir_path/$file" ]
		then
			echo "$IGNORE $dir/$file is a directory and will be ignored!$END"
		elif [ -z "$ignore" ]
		then
			update_file "$dir_path/$file" "$dir/$file"
		else
			echo "$IGNORE $dir/$file will be ignored!$END"
		fi
		ignore=""
	done
}

# Args 
# $1 = Path to file
# $2 = Path in repo
update_file()
{
	if [ -z "$1" ]; then die "You have to give at least one argument"; fi
	file_path="$1"
	file_name="$2"
	if [ -z "$file_name" ]
	then
		count=$(echo "$file_path" | sed -e 's/\(.\)/\1\n/g' | grep -c "/")
		count=$(echo "$count 1 +pq" | dc)
		file_name=$(echo "$file_path" | cut -d/ -f"$count")
	fi

	count=$(echo "$file_name" | sed -e 's/\(.\)/\1\n/g' | grep -c "/")
	count=$(echo "$count 1 +pq" | dc)
	tmp=$(echo "$file_name" | replace "$(echo "$file_name" | cut -d/ -f"$count")" "")
	if ! [ -e "$tmp" ] && [ -n "$tmp" ]
	then
		mkdir -p "$tmp"
	fi

	if [ -e "$file_name" ] && [ -e "$file_path" ]
	then
		if ! _diff "$file_path" "$file_name"
		then
			echo "$CHANGE Updating $file_name! $END"
			cp "$file_path" "$file_name"
		else
			echo "$UPTODATE $file_name is up-to-date! $END"
		fi
	elif ! [ -e "$file_name" ] && [ -e "$file_path" ]
	then
		echo "$CHANGE Creating $file_name! $END"
		cp "$file_path" "$file_name"
	elif [ ! -e "$file_path" ]
	then
		die "$file_path does not exist!"
	fi
}

update()
{
	if [ -d "$1" ]
	then
		update_dir "$1" "$2" "$3"
	else
		update_file "$1" "$2"
	fi
}
