#! /bin/sh
echo "grep "formatted_amounts=\[" | replace "formatted_amounts=[" "" | replace "]" "" | replace "\"" "" | cut -d, -f2"
