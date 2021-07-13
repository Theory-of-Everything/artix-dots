#!/usr/bin/sh

if notify-send "Now Playing:" "$(mpc --format '%title%\nby %artist%\n on %album%' current)" -u normal -a ncmpcpp -i $(playerctl metadata --player mpd -f "{{mpris:artUrl}}") ; then
	echo "Success"
else
	notify-send "Now Playing:" "$(mpc --format '%title%\nby %artist%\n on %album%' current)" -u normal -a ncmpcpp
fi
