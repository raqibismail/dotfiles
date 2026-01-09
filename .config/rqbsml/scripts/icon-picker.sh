#!/usr/bin/env bash

# A curated list of sources
choice=$(echo -e "󰭟 Emojis\n󰀉 Nerd Icons\n󱑍 Math Symbols" | rofi -dmenu -p "Select Category")

# Helper function to pick and type
pick_and_type() {
    # --action type is the built-in way, but if it fails, 
    # use --action print and pipe to wtype
    char=$(rofimoji --files "$1" --action print)
    
    if [ -n "$char" ]; then
        wtype "$char"
    fi
}

case "$choice" in
    *Emojis) pick_and_type "emoticons.csv" ;;
    *Nerd*)  pick_and_type "nerd_font.csv" ;;
    *Math*)  pick_and_type "math.csv" ;;
esac