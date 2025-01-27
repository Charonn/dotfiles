#!/bin/bash

# Get the default source
DEFAULT_SOURCE=$(pactl info | grep "Default Source" | awk '{print $3}')

# Get the mute status
MUTE_STATUS=$(pactl list sources | grep -A 15 "Name: $DEFAULT_SOURCE" | grep "Mute:" | awk '{print $2}')

# Output icon and text based on mute status
if [[ "$MUTE_STATUS" == "yes" ]]; then
    echo "{\"text\": \"\", \"tooltip\": \"Microphone is muted\", \"class\": \"muted\"}"
else
    echo "{\"text\": \"\", \"tooltip\": \"Microphone is unmuted\", \"class\": \"unmuted\"}"
fi
