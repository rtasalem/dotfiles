#!/bin/bash
active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 1 ]; then
  echo "<span foreground='#fab387'>[1]</span>"
else
  echo "<span foreground='#56b6c2'>[1]</span>"
fi
