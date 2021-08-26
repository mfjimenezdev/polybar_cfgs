#!/usr/bin/env bash

uptime=$(uptime -p | sed -e 's/up //g')
rofi_command="rofi -theme ~/.config/polybar/scripts/themes/sysmenu.rasi"

# Options
shutdown=" "
reboot=" "
lock=" "
suspend=" "
logout=" "

# Variable passed to rofi
options="$suspend\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
	systemctl poweroff;;

    $reboot)
	systemctl reboot;;

#    $lock)
#        ;;

    $suspend)
	mpc -q pause;
	amixer set Master mute;
	systemctl suspend;;

#    $logout)
#	bspc quit;;

esac
