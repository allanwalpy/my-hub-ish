#!/bin/bash

# ? starts audio sharing app `roc-send`;
# ? arguments:
# ?  - ip address of external recieving device;

command="roc-send -s rtp+rs8m://$1:10001 -r rs8m://$1:10002 --io-latency=10ms --frame-len 4ms --interleaving --color=always"

notify-send -u low -c im -a audio-external -h string:desktop-entry:nm-connection-editor -t 10000 -i dialog-warning "audio-external" "sharing audio to <b>$1</b> with <i>roc-send</i>" "`$command`"

$command

