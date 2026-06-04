#!/bin/bash
# ── nordvpn-toggle.sh ──────────────────────────────────────
# Toggles NordVPN connection via NordVPN CLI.
# Dependencies: nordvpn
# ───────────────────────────────────────────────────────────

status=$(nordvpn status 2>/dev/null | grep -i "^Status" | awk -F': ' '{print $2}' | tr -d '[:space:]')

if [[ "$status" == "Connected" ]]; then
    nordvpn disconnect
else
    nordvpn connect
fi
