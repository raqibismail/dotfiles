#!/bin/bash

# Configuration
MONITOR="eDP-1"
RES="1920x1080"
LOW="60"
HIGH="144"

# 1. Get current refresh rate from hyprctl
# This parses the 'refreshRate' value for your specific monitor
CURRENT_HZ=$(hyprctl monitors -j | jq -r ".[] | select(.name == \"$MONITOR\") | .refreshRate" | cut -d'.' -f1)

# 2. Add checkmarks based on current Hz
LOW_LABEL="Low ($LOW Hz)"
HIGH_LABEL="High ($HIGH Hz)"

if [ "$CURRENT_HZ" -eq "$LOW" ]; then
    LOW_LABEL="$LOW_LABEL ✔"
elif [ "$CURRENT_HZ" -eq "$HIGH" ]; then
    HIGH_LABEL="$HIGH_LABEL ✔"
fi

# 3. Use Rofi to pick
options="$LOW_LABEL\n$HIGH_LABEL"
choice=$(echo -e "$options" | rofi -dmenu -i -p "Monitor: $MONITOR ($CURRENT_HZ Hz)")

# 4. Action
case $choice in
    *"$LOW Hz"*)
        hyprctl keyword monitor "$MONITOR,$RES@$LOW,auto,1"
        notify-send "Hyprland" "Refresh rate set to $LOW Hz"
        ;;
    *"$HIGH Hz"*)
        hyprctl keyword monitor "$MONITOR,$RES@$HIGH,auto,1"
        notify-send "Hyprland" "Refresh rate set to $HIGH Hz"
        ;;
esac