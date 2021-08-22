#!/usr/bin/env bash

# Add this script to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q bspwm -c ~/.config/polybar/config.ini &
sleep 0.5
polybar -q top -c ~/.config/polybar/config.ini &
sleep 0.5
polybar -q bg -c ~/.config/polybar/config.ini &
