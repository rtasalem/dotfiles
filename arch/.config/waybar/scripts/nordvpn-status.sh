#!/bin/bash
# ── nordvpn-status.sh ──────────────────────────────────────
# Shows NordVPN connection status via NordVPN CLI.
# Dependencies: nordvpn
# ───────────────────────────────────────────────────────────

status=$(nordvpn status 2>/dev/null | grep -i "^Status" | awk -F': ' '{print $2}' | tr -d '[:space:]')

if [[ "$status" == "Connected" ]]; then
    country=$(nordvpn status 2>/dev/null | grep -i "^Country" | awk -F': ' '{print $2}' | xargs)
    [[ -z "$country" ]] && country="Unknown"
    echo "<span foreground='#fab387'>[ 󰌾 VPN: $country ]</span>"
else
    echo "<span foreground='#bf616a'>[ 󰌿 VPN: Off ]</span>"
fi
