#!/bin/bash
# ── mic.sh ─────────────────────────────────────────────────
# Shows microphone mute/unmute status with icon.
# Dependencies: pactl (PipeWire)
# ───────────────────────────────────────────────────────────

if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q 'yes'; then
    echo "<span foreground='#fab387'>[  ]</span>"
else
    echo "<span foreground='#56b6c2'>[  ]</span>"
fi
