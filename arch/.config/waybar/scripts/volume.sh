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

# ASCII bar (6 blocks wide)
filled=$((vol_int * 6 / 100))
[ $filled -gt 6 ] && filled=6
empty=$((6 - filled))
bar=$(printf '█%.0s' $(seq 1 $filled))
pad=$(printf '░%.0s' $(seq 1 $empty))
ascii_bar="[$bar$pad]"

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

echo "{\"text\":\"<span foreground='$fg'>$icon $ascii_bar $vol_int%</span>\",\"tooltip\":\"$tooltip\"}"
