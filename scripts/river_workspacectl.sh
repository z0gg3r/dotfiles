#!/bin/sh

reset_view_tag()
{
	riverctl set-focused-tags 0
}

show_tag()
{
	reset_view_tag
	tag_mask="$(calc "1 << $1")"
	riverctl set-focused-tags "$tag_mask"
}

send_to_tag()
{
	tag_mask="$(calc "1 << $1")"
	riverctl set-view-tags "$tag_mask"
}

follow_to_tag()
{
	send_to_tag "$1"
	show_tag "$1"
}

case $1 in
	"show") show_tag "$2" ;;
	"send-to") send_to_tag "$2" ;;
	"follow-to") follow_to_tag "$2" ;;
	*) true ;;
esac
