#!/bin/bash
# Script to check if any microphone is muted

# List all sources and their mute status
pactl list sources | grep -e 'Mute:' -e 'Name:' > /tmp/mic_mutes.txt

# Check for any muted microphones
if grep -B1 'Mute: yes' /tmp/mic_mutes.txt | grep -q 'Name:'; then
    echo ""  # FontAwesome icon for muted mic (adjust as needed)
else
    echo ""  # FontAwesome icon for unmuted mic
fi

# Clean up
rm /tmp/mic_mutes.txt
