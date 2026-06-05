#!/bin/bash
# ── brightness.sh ─────────────────────────────────────────
# Shows current brightness with ASCII bar + tooltip.
# Dependencies: brightnessctl, seq, printf, awk
# ─────────────────────────────────────────────────────────

brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
percent=$((brightness * 100 / max_brightness))

# Build ASCII bar (6 blocks max, no trailing empty blocks)
filled=$((percent * 6 / 100))
[ $filled -gt 6 ] && filled=6
[ $filled -lt 0 ] && filled=0
bar=$(printf '█%.0s' $(seq 1 $filled))
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

echo "{\"text\":\"<span foreground='$fg'>$icon $ascii_bar $percent%</span>\",\"tooltip\":\"$tooltip\"}"
