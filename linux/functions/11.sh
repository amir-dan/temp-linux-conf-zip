#!/usr/bin/env bash
killall waybar
exec waybar -c ~/.config/sway/bar.json -s ~/.config/sway/style.css
