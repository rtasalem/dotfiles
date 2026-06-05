#!/bin/bash
# ── nordvpn-status.sh ──────────────────────────────────────
# Shows NordVPN connection status via NordVPN CLI.
# Returns JSON so country appears in tooltip, not the bar.
# Dependencies: nordvpn
# ───────────────────────────────────────────────────────────

status=$(nordvpn status 2>/dev/null | grep -i "^Status" | awk -F': ' '{print $2}' | tr -d '[:space:]')

if [[ "$status" == "Connected" ]]; then
    country=$(nordvpn status 2>/dev/null | grep -i "^Country" | awk -F': ' '{print $2}' | xargs)
    [[ -z "$country" ]] && country="Unknown"
    echo "{\"text\":\"<span foreground='#fab387'><span font='14'>󰌾</span></span>\",\"tooltip\":\"NordVPN: $country\"}"
else
    echo "{\"text\":\"<span foreground='#bf616a'><span font='14'>󰌿</span></span>\",\"tooltip\":\"NordVPN: Disconnected\"}"
fi
