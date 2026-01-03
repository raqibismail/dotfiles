#!/usr/bin/env bash

# Buttons
shutdown=""
reboot=""
sleep=""
hibernate="󰛧"
lock=""
logout=""

# Variable passed to rofi
# Added sleep and hibernate to the list
options="$shutdown\n$reboot\n$sleep\n$hibernate\n$lock\n$logout"

chosen="$(echo -e "$options" | rofi -dmenu -theme powermenu.rasi)"

case $chosen in
    $shutdown) systemctl poweroff ;;
    $reboot) systemctl reboot ;;
    $sleep) systemctl suspend ;;
    $hibernate) systemctl hibernate ;;
    $lock) hyprlock ;;
    $logout) loginctl terminate-user $USER ;;
esac
