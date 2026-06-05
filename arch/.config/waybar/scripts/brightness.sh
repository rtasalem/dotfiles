#!/bin/bash
# ── brightness.sh ─────────────────────────────────────────
# Shows current brightness with ASCII bar + tooltip.
# Dependencies: brightnessctl, seq, printf, awk
# ─────────────────────────────────────────────────────────

brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
percent=$((brightness * 100 / max_brightness))

# Build ASCII bar (always 6 blocks: filled █ + empty ░)
filled=$((percent * 6 / 100))
[ $filled -gt 6 ] && filled=6
[ $filled -lt 0 ] && filled=0
empty=$((6 - filled))
bar=""
[ $filled -gt 0 ] && bar=$(printf '█%.0s' $(seq 1 $filled))
[ $empty -gt 0 ] && bar="${bar}$(printf '░%.0s' $(seq 1 $empty))"
ascii_bar="$bar"

icon="󰛨"

if [ "$percent" -lt 20 ]; then
    fg="#bf616a"
elif [ "$percent" -lt 55 ]; then
    fg="#fab387"
else
    fg="#56b6c2"
fi

device=$(brightnessctl --machine-readable | awk -F, 'NR==1 {print $1}')
tooltip="Brightness: $percent%\nDevice: $device"

echo "{\"text\":\"<span foreground='$fg'><span font='14' rise='-1000'>$icon</span> [ $ascii_bar ] $percent%</span>\",\"tooltip\":\"$tooltip\"}"
