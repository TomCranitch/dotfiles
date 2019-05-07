#!/bin/bash

if xrandr | grep "DP2 connected"; then
	xrandr --output eDP1 --off --output DP2 --auto
	killall -q compton
	while pgrep -u $UID -x compton >/dev/null; do sleep 1; done
	compton --blur-background --blur-method kawase --backend glx &
	killall -q polybar
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
	polybar white-second &
fi
