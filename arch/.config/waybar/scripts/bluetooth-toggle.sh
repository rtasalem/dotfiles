#!/bin/bash
# ── bluetooth-toggle.sh ──────────────────────────────────
# Toggles Bluetooth on/off using rfkill.
# Dependencies: rfkill
# ─────────────────────────────────────────────────────────

if rfkill list bluetooth | grep -q "Soft blocked: yes"; then
    rfkill unblock bluetooth
else
    rfkill block bluetooth
fi
