#!/bin/bash

# ? script intended to be used by `xfce4-genmon-plugin`

script_folder=$(dirname "$(readlink -fm "$0")")

status=$(systemctl is-active vpn.system)

echo "<iconclick>$0 toggle</iconclick>"
echo "<tool>$status</tool>"

# other candidates: network-server network-vpn package-available-locked package-installed-locked locked nm-vpn-standalone-lock nm-vpn-lock"
case $status in
    inactive)
        echo "<icon>dialog-password-symbolic</icon>"
        ;;
    active)
        echo "<icon>network-wireless-encrypted-symbolic</icon>"
        ;;
    *)
        echo "<icon>network-error</icon>"
esac

if [[ $1 != "toggle" ]]; then
    exit
fi

case $status in
    inactive)
        systemctl start vpn.system
        ;;
    active)
        systemctl stop vpn.system
        ;;
    *)
        command=$(notify-send --urgency low --category network.error --app-name vpn-system --hint string:desktop-entry:hiddify --wait --icon network-error --action d="dissmiss" --action s="stop" --action a="start" "vpn.system" "unknown status: $status")
        if [[ $command == "s" ]]; then
            systemctl stop vpn.system
        fi
        if [[ $command == "a" ]]; then
            systemctl start vpn.system
        fi
        exit 1
esac
