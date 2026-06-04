#!/bin/bash
active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 3 ]; then
  echo "<span foreground='#fab387'>[ 3 ]</span>"
else
  echo "<span foreground='#56b6c2'>[ 3 ]</span>"
fi
