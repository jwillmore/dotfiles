#!/bin/sh

wifi=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2)
online=$(ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo ok)

if [[ -z "$wifi" ]] && [[ "$online" == ok ]]; then
  wifi=" Ethernet"
elif [[ -z "$wifi" ]] && [[ "$online" != ok ]]; then
  wifi=" Arch Linux"
else
  wifi=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2 | sed 's/yes:/  /g')
fi

echo $wifi
