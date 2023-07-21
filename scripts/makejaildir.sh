#!/bin/sh
BASE="/opt/firejail"

prog="$1"

if [ -z "$prog" ]
then
	prog="$(uuidgen)"
fi

target="$BASE/$1"

if [ -d "$target" ]
then
	echo "$1 already exists"
	exit 1
fi

rsync -ai "$HOME/.local/share/skel" "$target"

printf "#!/bin/sh\n\n" > "$HOME/.local/bin/$prog"
printf "GTK_IM_MODULE=xim firejail --private=\"%b\" --noprofile --caps.drop=all --name=\"%b\" --machine-id\n" "$target" "$prog" >> "$HOME/.local/bin/$prog"

echo "Created jail-dir $target and program $prog"
