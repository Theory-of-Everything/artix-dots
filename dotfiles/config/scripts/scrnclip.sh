#!/bin/sh
IMG=~/Pictures/Screenshots/Clips/scrnclip_$(date +%m)_$(date +%d)_$(date +%y)_$(date +%s).png
maim -s $IMG
xclip -selection clipboard -t image/png -i < $IMG
sleep 0.5
#CONFIRM= echo -e 'Yes\nNo' | rofi -dmenu -p Save\ Scrot?
#if [ $CONFIRM -eq "Yes" ] ; then
#	notify.send 'bruh'
#else
#	notify.send 'not bruyh'
#fi
notify-send 'Screenclip Taken!' "$IMG" -u normal -a maim
