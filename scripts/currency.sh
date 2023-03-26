#!/bin/sh
# shellcheck disable=SC2140
echo "grep "formatted_amounts=\[" | replace "formatted_amounts=[" "" | replace "]" "" | replace "\"" "" | cut -d, -f2"
