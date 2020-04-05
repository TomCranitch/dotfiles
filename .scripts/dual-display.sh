#!/bin/bash

if xrandr | grep "DP1-2 connected"; then
	xrandr --output DP1-2 --right-of eDP1 --auto
	killall -q compton
	while pgrep -u $UID -x compton >/dev/null; do sleep 1; done
	compton -b &
	killall -q polybar
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
	polybar white-second & polybar white &
	wal -R &
fi
