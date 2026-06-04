#!/bin/bash
active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 10 ]; then
  echo "<span foreground='#fab387'>[ 10 ]</span>"
else
  echo "<span foreground='#56b6c2'>[ 10 ]</span>"
fi
