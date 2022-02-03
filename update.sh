#! /bin/sh
. ./updater.sh

if [ -n "$BASH_VERSION" ]
then
	echo "Please note that colour support only exists for POSIX sh, i.e. dash"
fi

# Syntax if target is a file:
# update [FILE] ([NAME])

# Syntax if target is a dir:
# update [DIR] [LIST OF FILES TO IGNORE] ([NAME])

# If [NAME] is not passed it is taked from the last
# part of the path, ie:
# /path/to/file -> $NAME = file
# /path/to/deeply/nested/dir/in/some/obscure/part/of/the/fs -> $NAME = fs

update "/home/zocki/.vimrc" "vimrc"
update "/home/zocki/.zshrc" "zshrc"
update "/home/zocki/.gitconfig" "gitconfig"
update "/home/zocki/.tmux.conf" "tmux.conf"
update "/home/zocki/.wallpapermap" "wallpapermap"
update "/home/zocki/.program_repos" "program_repos"
update "/home/zocki/.xinitrc" "xinitrc"
update "/home/zocki/.xserverrc" "xserverrc"
update "/home/zocki/.config/codemap" "codemap"
update "/home/zocki/.config/emojimap" "emojimap"
update "/home/zocki/.config/awesome/autostart.sh" "awesome/autostart.sh"
update "/home/zocki/.config/awesome/rc.lua" "awesome/rc.lua"
update "/etc/pacman.d/hooks/cleanup.hook" "pacman/cleanup.hook"
update "/etc/pacman.d/hooks/cleanup_r.hook" "pacman/cleanup_r.hook"
update "/etc/pacman.d/hooks/bash.hook" "pacman/bash.hook"
update "/home/zocki/.config/scripts"
update "/home/zocki/.config/env"
update "/home/zocki/.config/configures"
update "/home/zocki/.config/newsboat" "cache.db"
update "/home/zocki/.config/sakura"
update "/home/zocki/.config/awesome/themes/powerarrow" "wallpaper.jpg" "awesome/powerarrow"
update "/home/zocki/.config/awesome/themes/powerarrow/icons" "" "awesome/powerarrow/icons"
update "/home/zocki/.config/awesome/themes/powerarrow/icons/titlebar" "" "awesome/powerarrow/icons/titlebar"
update "/home/zocki/.config/awesome/freedesktop" "" "awesome/freedesktop"
update "/home/zocki/.config/awesome/lain" "" "awesome/lain"
update "/home/zocki/.config/awesome/lain/icons" "" "awesome/lain/icons"
update "/home/zocki/.config/awesome/lain/icons/cal" "" "awesome/lain/icons/cal"
update "/home/zocki/.config/awesome/lain/icons/cal/black" "" "awesome/lain/icons/cal/black"
update "/home/zocki/.config/awesome/lain/icons/cal/white" "" "awesome/lain/icons/cal/white"
update "/home/zocki/.config/awesome/lain/icons/layout" "" "awesome/lain/icons/layout"
update "/home/zocki/.config/awesome/lain/icons/layout/default" "" "awesome/lain/icons/layout/default"
update "/home/zocki/.config/awesome/lain/icons/layout/zenburn" "" "awesome/lain/icons/layout/zenburn"
update "/home/zocki/.config/awesome/lain/icons/openweathermap" "" "awesome/lain/icons/openweathermap"
update "/home/zocki/.config/awesome/lain/layout" "" "awesome/lain/layout"
update "/home/zocki/.config/awesome/lain/widget" "" "awesome/lain/widget"
update "/home/zocki/.config/awesome/lain/widget/contrib" "" "awesome/lain/widget/contrib"
update "/home/zocki/.config/awesome/lain/util" "" "awesome/lain/util"
