#!/bin/sh

file=$(find -type f | bemenu -i --tb '#d79921' --tf '#282828' --nb '#282828' --hb '#d79921' --hf '#282828' --fb '#282828' -H 30 -p 'File sharing' --fn 'Noto Sans' -l 5)

if [ $? = 0 ]; then
  curl -F "file=@$file" 0x0.st | wl-copy
  sussy=$(wl-paste)
  notify-send "Shared file: $sussy"
fi
