#! /bin/sh
MAIL_DIR="/home/zocki/.local/share/sendmail"
READ="read"
UNREAD="new"

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
	echo "Mail: $combined"
	echo "Mail (read): $count_read"
	echo "Mail (unread): $count_unread"
}

add_mail()
{
	date=$(date +%Y-%m-%d)
	time=$(date +%H:%M:%S)
	echo "$@" > "$MAIL_DIR/$UNREAD/$date-$time.mail"
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
		die "$1 does not exist."
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

case $1 in
	"status") mail_count ;;
	"mark-all-read") mark_all_read ;;
	"list-unread") list_unread ;;
	"list-read") list_read ;;
	"mark-read") mark_read "$2" ;;
	"read") read_mail "$2" ;;
	"remove-read") remove_read_mail "$@" ;;
	"remove-unread") remove_unread_mail "$@" ;;
	*) add_mail "$@" ;;
esac
