#!/bin/bash
active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 6 ]; then
  echo "<span foreground='#fab387'>[ 6 ]</span>"
else
  echo "<span foreground='#56b6c2'>[ 6 ]</span>"
fi
