#!/bin/bash
active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 5 ]; then
  echo "<span foreground='#fab387'>[ 5 ]</span>"
else
  echo "<span foreground='#56b6c2'>[ 5 ]</span>"
fi
