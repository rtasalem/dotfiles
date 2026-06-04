#!/bin/bash
active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 9 ]; then
  echo "<span foreground='#fab387'>[ 9 ]</span>"
else
  echo "<span foreground='#56b6c2'>[ 9 ]</span>"
fi
