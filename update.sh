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

update "$HOME/.vimrc" "vimrc"
update "$HOME/.zshrc" "zshrc"
update "$HOME/.gitconfig" "gitconfig"
update "$HOME/.tmux.conf" "tmux.conf"
update "$HOME/.wallpapermap" "wallpapermap"
update "$HOME/.program_repos" "program_repos"
update "$HOME/.xinitrc" "xinitrc"
update "$HOME/.xserverrc" "xserverrc"
update "$HOME/.config/codemap" "codemap"
update "$HOME/.config/emojimap" "emojimap"
update "/etc/pacman.d/hooks/cleanup.hook" "pacman/cleanup.hook"
update "/etc/pacman.d/hooks/cleanup_r.hook" "pacman/cleanup_r.hook"
update "/etc/pacman.d/hooks/bash.hook" "pacman/bash.hook"
update "$HOME/.config/scripts"
update "$HOME/.config/env"
update "$HOME/.config/configures"
update "$HOME/.config/newsboat" "cache.db"
update "$HOME/.config/sakura"
update "$HOME/.config/zen-config" "kernel/zen"
