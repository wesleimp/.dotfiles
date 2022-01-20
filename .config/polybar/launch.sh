#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

WIRELESS=$(ls /sys/class/net/ | grep ^wl | awk 'NR==1{print $1}') polybar --reload main &

echo "Bars launched..."
