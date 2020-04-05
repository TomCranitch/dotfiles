#!/bin/bash

if xrandr | grep "eDP1 connected"; then
	xrandr --output DP2 --off --output eDP1 --auto
	killall -q compton
	while pgrep -u $UID -x compton >/dev/null; do sleep 1; done
	compton -b &
	killall -q polybar
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
	polybar white-second &
	wal -R &
fi
