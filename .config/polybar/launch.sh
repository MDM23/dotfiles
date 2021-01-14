#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

case "$LOCATION" in
	"home")
		MONITOR_PRIMARY="DP-2"
		MONITOR_SECONDARY="HDMI-0"
        ;;
	"office")
		MONITOR_PRIMARY="DisplayPort-0"
		MONITOR_SECONDARY="DVI-0"
        ;;
esac

function launch {
    MONITOR_PRIMARY="$MONITOR_PRIMARY" \
    MONITOR_SECONDARY="$MONITOR_SECONDARY" \
    polybar --reload $1 &
}

launch main
launch secondary
