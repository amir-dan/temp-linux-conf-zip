#!/usr/bin/env bash
sleep 0.5
nowdate=$(date +%y%m%d%H%M%S)
grim ~/Temporary/$nowdate.png
convert ~/Temporary/$nowdate.png ~/Temporary/$nowdate.avif
rm ~/Temporary/$nowdate.png
