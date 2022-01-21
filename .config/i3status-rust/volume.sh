#!/bin/sh

volume=$(pulsemixer --get-volume | sed 's/ .*//')
mute=$(pulsemixer --get-mute)

if [ $mute = 0 ] && [ $volume -ge 50 ]; then
  volume=$(pulsemixer --get-volume | sed 's/ .*//' | sed 's/.*/ &/')
elif [ $mute = 0 ] && [ $volume -lt 50 ]; then
  volume=$(pulsemixer --get-volume | sed 's/ .*//' | sed 's/.*/ &/')
elif [ $mute = 1 ]; then 
  volume=$(echo  X)
fi

echo $volume > ~/.config/i3status-rust/volume_current
