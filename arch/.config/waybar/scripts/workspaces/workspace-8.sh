#!/bin/bash
active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 8 ]; then
  echo "<span foreground='#fab387'>[ 8 ]</span>"
else
  echo "<span foreground='#56b6c2'>[ 8 ]</span>"
fi
