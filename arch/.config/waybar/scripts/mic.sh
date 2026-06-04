#!/bin/bash
# ── mic.sh ─────────────────────────────────────────────────
# Shows microphone mute/unmute status with icon.
# Dependencies: pactl (PipeWire)
# ───────────────────────────────────────────────────────────

if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q 'yes'; then
    echo "{\"text\":\"<span foreground='#fab387'>[ 󰍭 ]</span>\",\"tooltip\":\"Mic: Muted\"}"
else
    echo "{\"text\":\"<span foreground='#56b6c2'>[ 󰍬 ]</span>\",\"tooltip\":\"Mic: Active\"}"
fi
