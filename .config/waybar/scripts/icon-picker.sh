#!/usr/bin/env bash

# A curated list of sources
choice=$(echo -e "󰭟 Emojis\n󰀉 Nerd Icons\n󶗶 Font Awesome\n󱑍 Math Symbols" | rofi -dmenu -p "Select Category")

case "$choice" in
    *Emojis) rofimoji --files emoticons.csv --action copy ;;
    *Nerd*) rofimoji --files nerd_font.csv --action copy ;;
    *Font*) rofimoji --files font_awesome_5.csv --action copy ;;
    *Math*) rofimoji --files math.csv --action copy ;;
esac