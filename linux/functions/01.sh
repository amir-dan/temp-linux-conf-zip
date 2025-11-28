#!/usr/bin/env bash
exec=$(j4-dmenu-desktop --dmenu="bemenu -p '' --cw 2 --hp 8 --fn 'JetBrains Mono NL 10'" --no-exec)
exec $exec
