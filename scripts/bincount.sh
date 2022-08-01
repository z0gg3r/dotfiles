#! /bin/sh
usr_bin="$(/bin/ls /usr/bin | wc -l)"
bin="$(/bin/ls /bin | wc -l)"
local_bin="$(/bin/ls /usr/local/bin | wc -l)"
home_bin="$(/bin/ls /home/zocki/.local/bin | wc -l)"
sbin="$(/bin/ls /sbin | wc -l)"
usr_sbin="$(/bin/ls /usr/sbin | wc -l)"

dc_args="$bin $usr_bin $local_bin $home_bin $sbin $usr_sbin +++++ pq"

total="$(echo "$dc_args" | dc)"

echo "/bin: $bin"
echo "/usr/bin: $usr_bin"
echo "/usr/local/bin: $local_bin"
echo "$HOME/.local/bin: $home_bin"
echo "/sbin: $sbin"
echo "/usr/sbin: $usr_sbin"
echo "total: $total"
