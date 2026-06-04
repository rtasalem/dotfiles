#!/bin/bash
# ── brightness-toggle.sh ─────────────────────────────────
# Cycles screen brightness: 30% → 60% → 100% → 30%
# Dependencies: brightnessctl
# ─────────────────────────────────────────────────────────

current=$(brightnessctl get)
max=$(brightnessctl max)
percent=$((current * 100 / max))

if [ "$percent" -lt 45 ]; then
    brightnessctl set 60%
elif [ "$percent" -lt 85 ]; then
    brightnessctl set 100%
else
    brightnessctl set 30%
fi
