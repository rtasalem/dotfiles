#!/bin/bash
active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 2 ]; then
  echo "<span foreground='#fab387'>[2]</span>"
else
  echo "<span foreground='#56b6c2'>[2]</span>"
fi
