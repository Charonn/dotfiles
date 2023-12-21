#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar --list-monitors | while read -r line; do
    m=$(echo $line | cut -d":" -f1)
    if [[ "$line" == *"(primary)"* ]]; then
        MONITOR=$m polybar --reload bar &
    else
        MONITOR=$m polybar --reload side &
    fi
done

echo "Polybar launched..."
