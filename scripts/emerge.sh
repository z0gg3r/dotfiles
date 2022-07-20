#! /bin/sh

start="$(/bin/date '+%s')"

if ! [ "$1" = "update" ]
then
	doas emerge -atv "$@"
else
	doas emerge -autND @world
fi

end="$(/bin/date '+%s')"

diff=$(echo "$end - $start" | calc -p)

printf "Took %bs\n" "$diff"
