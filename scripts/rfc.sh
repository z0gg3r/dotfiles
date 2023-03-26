#!/bin/sh
if [ -z "$1" ]; then exit 1; fi
TMP=$(mktemp)
BASE="https://rfc-editor.org/rfc"
curl -sL "$BASE/rfc$1.txt" | sed 's///' |  while read -r line
do
	pad -m "centre" -s "$line" >> "$TMP.new"
done
uniq "$TMP.new" "$TMP"
less -sNJL < "$TMP" && rm "$TMP" "$TMP.new"
