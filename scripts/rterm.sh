#! /bin/sh
limit=9
choice=$(rnum -p -r $limit)

case choice in
	1) exec sakura;;
	2) exec alacritty;;
	3) exec crt;;
	4) exec termite;;
	5) exec urvxt;;
	6) exec uxterm -fg green -bg black;;
	7) exec konsole;;
	8) exec kitty;;
	*) exec sakura;;
esac
