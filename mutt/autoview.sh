#! /bin/sh

view_html()
{
	target="/tmp/$(uuidgen).html"
	cp "$1" "$target"
	chosen="$(printf "surf\nw3m\npdf\nglinks\n" | fzy)"
	if [ -z "$chosen" ]
	then
		chosen="surf"
	fi
	case $chosen in
		"pdf") tmp_pdf "$target" ;;
		"glinks") "$HOME"/.local/scripts/glinks.sh "$target" ;;
		"w3m") view_w3m "$target" ;;
		*) view_surf "$target" ;;
	esac
	rm "$target"
}

view_w3m()
{
	firejail --noprofile \
		--hosts-file="$HOME/.config/adblocklist" \
		--private \
		--nodvd \
		--nosound \
		--notv \
		--nou2f \
		--novideo \
		--private-cache \
		--disable-mnt \
		--net=none \
		--caps.drop=all \
		--name="mutt-w3m-viewer" \
		--nonewprivs \
		/usr/bin/w3m -no-cookie -no-graph \
		-F -H -t 8 -ppc 32.0 -ppl 64.0 -title="mutt-w3m-viewer" \
		"$1"
}

view_surf()
{
	firejail --noprofile \
		--hosts-file="$HOME/.config/adblocklist" \
		--private \
		--nodvd \
		--nosound \
		--notv \
		--nou2f \
		--novideo \
		--private-cache \
		--disable-mnt \
		--net=none \
		--machine-id \
		--caps.drop=all \
		--name="mutt-surf-viewer" \
		/usr/local/bin/surf-viewer -u "$SURF_USERAGENT" -s -g -n -m -t "$1"
}

tmp_pdf()
{
	target="$1"
	tmpdir="/tmp/$(uuidgen)"
	mkdir "$tmpdir"
	! [ -d "$tmpdir" ] && exit
	pandoc --quiet -i "$target" -o "$tmpdir/tmp.tex"
	pandoc --quiet -i "$tmpdir/tmp.tex" -o "$tmpdir/tmp.pdf"
	zathura "$tmpdir/tmp.pdf" && rm -rf "$tmpdir"
}

view_image()
{
	2ff > /tmp/mail.ff < "$1" || rm /tmp/mail.ff
	if [ -e "/tmp/mail.ff" ]
	then
		lel /tmp/mail.ff && rm /tmp/mail.ff
	else
		nsxiv "$1"
	fi
}

view_odt()
{
	pandoc -o /tmp/odt.pdf "$1" || exit 1
	zathura /tmp/odt.pdf && rm /tmp/odt.pdf
}

if [ -n "$2" ]
then
	case $2 in
		html) view_html "$1" ;;
		pdf) zathura "$1" ;;
		image) view_image "$1" ;;
		odt) view_odt "$1" ;;
		*) links -anonymous -no-connect "$1" ;;
	esac
fi
