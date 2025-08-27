#!/bin/bash

# ? script intended to be used by `xfce4-genmon-plugin`

script_folder=$(dirname "$(readlink -fm "$0")")

status=$(systemctl --user is-active vpn.user)

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
        exit 1
esac

if [[ $1 != "toggle" ]]; then
    exit
fi

case $status in
    inactive)
        systemctl --user start vpn.user
        ;;
    active)
        systemctl --user stop vpn.user
        ;;
    *)
        command=$(notify-send --urgency low --category network.error --app-name vpn-user --hint string:desktop-entry:hiddify --wait --icon network-error --action x="dissmiss" --action s="stop" --action a="start" "vpn.user" "unknown status: $status")
        if [[ $command == "s" ]]; then 
            systemctl --user stop vpn.user
        fi
        if [[ $command == "a" ]]; then 
            systemctl --user start vpn.user
        fi
        exit 1
esac
