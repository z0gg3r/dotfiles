#! /bin/sh
UPTODATE="\033[32;48m"
CHANGE="\033[33;38m"
ERROR="\033[31;48m"
INFO="\033[35;48m"
IGNORE="\033[34;48m"
END="\033[0m"

echo "$INFO Using $HOME as \$HOME ! $END"
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
update_dir()
{
	dir_path=$1
	count=$(echo "$dir_path" | sed -e 's/\(.\)/\1\n/g' | grep -c "/")
	count=$(echo "$count 1 +pq" | dc)
	dir=$(echo "$dir_path" | cut -d/ -f$count)
	ignore_list=$2
	if ! [ -e "$dir_path" ]
	then
		die "$dir_path does not exist!"
	fi
	if ! [ -e "$dir" ]
	then
		mkdir "$dir"
	fi
	for file in $($(which ls) "$dir_path")
	do
		case $ignore_list in
			*$file*) ignore="yes" ;;
		esac
		if [ -z "$ignore" ]
		then
			update_file "$dir_path/$file" "$dir/$file"
		else
			echo "$IGNORE $file will be ignored!$END"
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
		file_name=$(echo "$file_path" | cut -d/ -f$count)
	fi

	count=$(echo "$file_name" | sed -e 's/\(.\)/\1\n/g' | grep -c "/")
	count=$(echo "$count 1 +pq" | dc)
	tmp=$(echo "$file_name" | replace "$(echo "$file_name" | cut -d/ -f$count)" "")
	echo "!!!!!!!! $file_name $file_path $tmp !!!!!!!!!!!"
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
	if [ "$(file "$1" | cut -d ":" -f2)" = " directory" ]
	then
		update_dir "$1" "$2"
	else
		update_file "$1" "$2"
	fi
}


update_dir "/home/zocki/.config/scripts" "unicode.sh"
update_dir "/home/zocki/.config/env"
# update /home/zocki/.program_repos
# update_file /home/zocki/.program_repos "progs"
update_file /home/zocki/.2048
