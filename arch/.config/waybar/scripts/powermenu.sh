#!/bin/bash
# ── powermenu.sh ───────────────────────────────────────────
# Rofi power menu integrated with Waybar.
# Dependencies: rofi, systemctl, hyprctl
# ───────────────────────────────────────────────────────────

rofi_command="rofi -dmenu -p Power"
options="Shutdown\nReboot\nLogout\nSuspend\nLock"

chosen="$(echo -e "$options" | $rofi_command)"
case $chosen in
    Shutdown) systemctl poweroff ;;
    Reboot)   systemctl reboot ;;
    Logout)   hyprctl dispatch exit ;;
    Suspend)  systemctl suspend ;;
    Lock)     hyprlock ;;
esac
