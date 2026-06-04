#!/bin/bash
active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 4 ]; then
  echo "<span foreground='#fab387'>[ 4 ]</span>"
else
  echo "<span foreground='#56b6c2'>[ 4 ]</span>"
fi
