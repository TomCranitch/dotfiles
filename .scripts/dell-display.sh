#!/bin/bash

if xrandr | grep "eDP-1 connected"; then
	xrandr --output DP-1-2 --off --output eDP-1 --auto
	killall -q compton
	while pgrep -u $UID -x compton >/dev/null; do sleep 1; done
	compton -b &
	killall -q polybar
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
	polybar bar &
	wal -R &
fi
