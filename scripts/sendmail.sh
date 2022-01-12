#! /bin/sh
MAIL_DIR="/home/zocki/.local/share/sendmail"
READ="read"
UNREAD="unread"

MENU_EXIT_FORCE="Menu selection has been aborted. Exiting."
MENU_EXIT="Closing sendmail."

die()
{
	echo "$1"
	exit 1
}

get_file_name()
{
	count=$(echo "$1" | sed -e 's/\(.\)/\1\n/g' | grep -c "/")
	count=$(echo "$1 1 +pq" | dc)
	echo "$1" | cut -d"/" -f"$count"
}

mail_count()
{
	count_read="$(/usr/bin/ls "$MAIL_DIR/$READ" | wc -l)"
	count_unread="$(/usr/bin/ls "$MAIL_DIR/$UNREAD" | wc -l)"
	combined=$(echo "$count_read + $count_unread" | calc -p)
	echo "$combined ($count_read read / $count_unread unread)"
}

add_mail()
{
	date=$(date +%Y-%m-%d)
	time=$(date +%H%M%S)
	while read -r mail_in
	do
		echo "$mail_in" >> "$MAIL_DIR/$UNREAD/$date-$time.mail"
	done
}

read_mail()
{
	if [ -e "$MAIL_DIR/$UNREAD/$1" ]
	then
		less "$MAIL_DIR/$UNREAD/$1" && mark_read "$1"
	elif [ -e "$MAIL_DIR/$READ/$1" ]
	then
		less "$MAIL_DIR/$READ/$1"
	else
		echo "$1 does not exist"
	fi
}

mark_read()
{
	mv "$MAIL_DIR/$UNREAD/$1" "$MAIL_DIR/$READ/$1"
}

mark_all_read()
{
	for file in $MAIL_DIR/$UNREAD/"*.mail"
	do
		mark_read "$(get_file_name "$file")"
	done

	echo "Marked all mail as read!"
}

list_unread()
{
	ls "$MAIL_DIR/$UNREAD"
}

list_read()
{
	ls "$MAIL_DIR/$READ"
}

remove_read_mail()
{
	for mail in "$@"
	do
		rm "$MAIL_DIR/$READ/$mail"
	done
}

remove_unread_mail()
{
	for mail in "$@"
	do
		rm "$MAIL_DIR/$UNREAD/$mail"
	done
}

remove_menu()
{
	mail_count
	choice=$(printf "%b\n%b\nclose" "$READ" "$UNREAD" | fzy)
	if [ -z "$choice" ]
	then
		die "$MENU_EXIT_FORCE"
	fi
	if [ "$choice" = "close" ]
	then
		echo "$MENU_EXIT"
		exit
	fi

	tmp_file="$MAIL_DIR/$choice/close"
	tmp="$choice"
	touch "$tmp_file"

	choice=$(ls "$MAIL_DIR/$choice" | fzy)
	if [ -z "$choice" ]
	then
		rm "$tmp_file"
		die "$MENU_EXIT_FORCE"
	fi
	if [ "$choice" = "close" ]
	then
		rm "$tmp_file"
		echo "$MENU_EXIT"
		exit
	fi

	rm "$tmp_file" "$MAIL_DIR/$tmp/$choice" 
	mail_count
	choice=$(printf "continue\nclose" | fzy)
	if [ -z "$choice" ]
	then
		die "$MENU_EXIT_FORCE"
	fi
	if [ "$choice" = "close" ]
	then
		echo "$MENU_EXIT"
		exit
	fi
	remove_menu
}

read_menu()
{
	mail_count
	choice=$(printf "%b\n%b\nclose" "$READ" "$UNREAD" | fzy )
	if [ -z "$choice" ]
	then
		die "$MENU_EXIT_FORCE"
	fi
	if [ "$choice" = "close" ]
	then
		echo "$MENU_EXIT"
		exit
	fi
	
	tmp_file="$MAIL_DIR/$choice/close"
	touch "$tmp_file"

	choice=$(ls "$MAIL_DIR"/"$choice" | fzy)
	if [ -z "$choice" ]
	then
		rm "$tmp_file"
		die "$MENU_EXIT_FORCE"
	fi
	if [ "$choice" = "close" ]
	then
		echo "$MENU_EXIT"
		rm "$tmp_file"
		exit
	fi
	rm "$tmp_file"
	read_mail "$choice"
	mail_count
}

read_wrapper()
{
	if [ -z "$1" ]
	then
		read_menu
	else
		read_mail "$1"
		shift
		while [ $# -ge 1 ]
		do
			read_mail "$1"
			shift
		done
	fi
}

usage()
{
	printf "sendmail "
	printf "["
	printf "status"
	printf " | "
	printf "mark-all-read"
	printf " | "
	printf "mark-read"
	printf " | "
	printf "list-unread"
	printf " | "
	printf "list-read"
	printf " | "
	printf "read"
	printf " | "
	printf "read-menu"
	printf " | "
	printf "remove"
	printf " | "
	printf "remove-read"
	printf " | "
	printf "remove-unread"
	printf "]\n"
	echo "read-menu and remove launch a CLI-menu. read launches a CLI-menu if no arguments are given"
}

case $1 in
	"help") usage ;;
	"usage") usage ;;
	"status") mail_count ;;
	"mark-all-read") mark_all_read ;;
	"list-unread") list_unread ;;
	"list-read") list_read ;;
	"mark-read") mark_read "$2" ;;
	"read") shift && read_wrapper "$@" ;;
	"read-menu") read_menu ;;
	"remove") remove_menu ;;
	"remove-read") shift && remove_read_mail "$@" ;;
	"remove-unread") shift && remove_unread_mail "$@" ;;
	"add") add_mail ;;
	*) usage ;;
esac
