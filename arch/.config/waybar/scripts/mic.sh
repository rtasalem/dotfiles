#!/bin/bash
# ── mic.sh ─────────────────────────────────────────────────
# Shows microphone mute/unmute status with icon.
# Dependencies: pactl (PipeWire)
# ───────────────────────────────────────────────────────────

if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q 'yes'; then
    echo "{\"text\":\"[ <span foreground='#fab387' font='14'>󰍭</span> ]\",\"tooltip\":\"Mic: Muted\",\"class\":\"muted\"}"
else
    echo "{\"text\":\"[ <span foreground='#56b6c2' font='14'>󰍬</span> ]\",\"tooltip\":\"Mic: Active\",\"class\":\"active\"}"
fi
