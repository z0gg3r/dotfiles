#!/bin/sh

echo 'print -rl -- ${(k)aliases} | while read -r zsh_alias; do type "$zsh_alias"; done'
