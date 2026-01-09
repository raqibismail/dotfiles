#!/usr/bin/env bash

DIR="$HOME/Pictures/Screenshot"
mkdir -p "$DIR"

# Rofi Menu
options="Region\nFullscreen\nWindow"
choice=$(echo -e "$options" | rofi -dmenu -p "Screenshot" -theme-str 'window {width: 300px; height: 300px;}')

case "$choice" in
    Region)
        GEOM=$(slurp -b 00000088 -c ffffffff -w 2) || exit 1
        # 1. Take screenshot
        # 2. tee sends it to wl-copy AND swappy simultaneously
        grim -g "$GEOM" - | tee >(wl-copy) | swappy -f -
        ;;
    Fullscreen)
        grim - | tee >(wl-copy) | swappy -f -
        ;;
    Window)
        GEOM=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        grim -g "$GEOM" - | tee >(wl-copy) | swappy -f -
        ;;
    *)
        exit 0
        ;;
esac