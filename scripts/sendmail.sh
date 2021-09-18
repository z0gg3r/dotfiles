#! /bin/sh
MAIL_DIR="/home/zocki/.local/mail"

date="$(/bin/date +%F)"
time="$(/bin/date +%H-%M-%S)"

filename="mail_$date_$time"

echo "$@" > "$MAIL_DIR/$filename"
