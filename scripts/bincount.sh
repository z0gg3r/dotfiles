#! /bin/sh
bin="$(/usr/bin/ls /usr/bin | wc -l)"
local_bin="$(/usr/bin/ls /usr/local/bin | wc -l)"

dc_args="$bin $local_bin + pq"

total="$(echo "$dc_args" | dc)"

echo "/usr/bin: $bin"
echo "/usr/local/bin: $local_bin"
echo "total: $total"
