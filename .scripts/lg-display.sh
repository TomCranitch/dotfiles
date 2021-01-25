#!/bin/bash

if xrandr | grep "DP-1-2 connected"; then
	xrandr --output eDP-1 --off --output DP-1-2 --auto
	killall -q compton
	while pgrep -u $UID -x compton >/dev/null; do sleep 1; done
	compton -b &
	killall -q polybar
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
	polybar bar &
	wal -R &
fi
