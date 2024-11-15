#!/bin/sh


show_tag()
{
	tag_mask="$(left-shift "$1")"
	riverctl set-focused-tags "$tag_mask"
}

send_to_tag()
{
	tag_mask="$(left-shift "$1")"
	riverctl set-view-tags "$tag_mask"
}

follow_to_tag()
{
	send_to_tag "$1"
	show_tag "$1"
}

case $1 in
	"show") show_tag "$2" ;;
	"send2") send_to_tag "$2" ;;
	"follow2") follow_to_tag "$2" ;;
	*) true ;;
esac
