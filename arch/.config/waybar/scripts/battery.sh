#!/bin/bash
# ── battery.sh ─────────────────────────────────────────────
# Shows battery % with ASCII bar + dynamic tooltip.
# Aggregates BAT0 + BAT1 for ThinkPad T480 dual battery.
# Dependencies: upower, awk, seq, printf
# ───────────────────────────────────────────────────────────

# Aggregate BAT0 and BAT1 if both exist
if [ -f /sys/class/power_supply/BAT1/capacity ]; then
    cap0=$(cat /sys/class/power_supply/BAT0/capacity)
    cap1=$(cat /sys/class/power_supply/BAT1/capacity)
    capacity=$(( (cap0 + cap1) / 2 ))
    status=$(cat /sys/class/power_supply/BAT0/status)
    # Prefer Charging/Discharging from either battery
    if grep -q "Charging" /sys/class/power_supply/BAT0/status 2>/dev/null || \
       grep -q "Charging" /sys/class/power_supply/BAT1/status 2>/dev/null; then
        status="Charging"
    fi
else
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(cat /sys/class/power_supply/BAT0/status)
fi

charging_icons=(󰢜 󰂆 󰂇 󰂈 󰢝 󰂉 󰢞 󰂊 󰂋 󰂅)
default_icons=(󰁺 󰁻 󰁼 󰁽 󰁾 󰁿 󰂀 󰂁 󰂂 󰁹)

index=$((capacity / 10))
[ $index -ge 10 ] && index=9

if [[ "$status" == "Charging" ]]; then
    icon=${charging_icons[$index]}
elif [[ "$status" == "Full" ]]; then
    icon="󰂅"
else
    icon=${default_icons[$index]}
fi

# ASCII bar (6 blocks wide)
filled=$((capacity * 6 / 100))
[ $filled -gt 6 ] && filled=6
empty=$((6 - filled))
bar=$(printf '█%.0s' $(seq 1 $filled))
pad=$(printf '░%.0s' $(seq 1 $empty))
ascii_bar="[$bar$pad]"

# Color thresholds
if [ "$capacity" -lt 20 ]; then
    fg="#bf616a"
elif [ "$capacity" -lt 55 ]; then
    fg="#fab387"
else
    fg="#56b6c2"
fi

tooltip="Battery: $capacity% ($status)"

echo "{\"text\":\"<span foreground='$fg'>$icon $ascii_bar $capacity%</span>\",\"tooltip\":\"$tooltip\"}"
