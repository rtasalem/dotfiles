#!/bin/bash
# ── volume.sh ─────────────────────────────────────────────
# Shows current audio volume with ASCII bar + tooltip.
# Dependencies: wpctl, awk, bc, seq, printf
# ───────────────────────────────────────────────────────────

vol_raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print $2 }')
vol_int=$(echo "$vol_raw * 100" | bc | awk '{ print int($1) }')

is_muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo true || echo false)

sink=$(wpctl status | awk '/Sinks:/,/Sources:/' | grep '\*' | cut -d'.' -f2- | sed 's/^\s*//; s/\[.*//')

if [ "$is_muted" = true ]; then
    icon="󰝟"
    vol_int=0
elif [ "$vol_int" -lt 34 ]; then
    icon="󰕿"
elif [ "$vol_int" -lt 67 ]; then
    icon="󰖀"
else
    icon="󰕾"
fi

# ASCII bar (always 6 blocks: filled █ + empty ░)
filled=$((vol_int * 6 / 100))
[ $filled -gt 6 ] && filled=6
[ $filled -lt 0 ] && filled=0
empty=$((6 - filled))
bar=""
[ $filled -gt 0 ] && bar=$(printf '█%.0s' $(seq 1 $filled))
[ $empty -gt 0 ] && bar="${bar}$(printf '░%.0s' $(seq 1 $empty))"
ascii_bar="$bar"

if [ "$is_muted" = true ] || [ "$vol_int" -lt 10 ]; then
    fg="#bf616a"
elif [ "$vol_int" -lt 50 ]; then
    fg="#fab387"
else
    fg="#56b6c2"
fi

if [ "$is_muted" = true ]; then
    tooltip="Audio: Muted\nOutput: $sink"
else
    tooltip="Audio: $vol_int%\nOutput: $sink"
fi

echo "{\"text\":\"<span foreground='$fg'>$icon [ $ascii_bar ] $vol_int%</span>\",\"tooltip\":\"$tooltip\"}"
