#! /bin/sh
. ./updater.sh

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
update "/etc/pacman.d/hooks/cleanup.hook" "pacman/cleanup.hook"
update "/etc/pacman.d/hooks/cleanup_r.hook" "pacman/cleanup_r.hook"
update "/etc/pacman.d/hooks/bash.hook" "pacman/bash.hook"
update "/home/zocki/.config/scripts"
update "/home/zocki/.config/env"
update "/home/zocki/.config/configures"
update "/home/zocki/.config/newsboat" "cache.db"
update "/home/zocki/.config/sakura"
