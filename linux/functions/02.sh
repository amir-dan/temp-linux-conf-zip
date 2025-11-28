#!/usr/bin/env bash
killall swaybg
exec swaybg -i ~/Photos/wallpaper/r$((1 + $RANDOM % $(ls ~/Photos/wallpaper/r*.jpeg | wc -l))).jpeg -m fill
