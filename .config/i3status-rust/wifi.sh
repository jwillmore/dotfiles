#!/bin/sh

wifi=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2)

if [[ -z "$wifi" ]]; then
  wifi=" Arch Linux"
else
  wifi=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2 | sed 's/yes:/  /g')
fi

echo $wifi
