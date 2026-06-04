#!/bin/bash
# ── mic.sh ─────────────────────────────────────────────────
# Shows microphone mute/unmute status with icon.
# Dependencies: pactl (PipeWire)
# ───────────────────────────────────────────────────────────

if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q 'yes'; then
    echo "{\"text\":\"[ 󰍭 ]\",\"tooltip\":\"Mic: Muted\",\"class\":\"muted\"}"
else
    echo "{\"text\":\"[ 󰍬 ]\",\"tooltip\":\"Mic: Active\",\"class\":\"active\"}"
fi
