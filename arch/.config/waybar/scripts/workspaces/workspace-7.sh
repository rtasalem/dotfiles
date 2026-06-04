#!/bin/bash
active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 7 ]; then
  echo "<span foreground='#fab387'>[ 7 ]</span>"
else
  echo "<span foreground='#56b6c2'>[ 7 ]</span>"
fi
