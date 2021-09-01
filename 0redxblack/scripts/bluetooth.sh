#!/usr/bin/env bash

function app {
  if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
    echo "%{T6}%{F#66ffffff} %{T-}"
  else
    if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]; then
      echo "%{T6} %{T-}"
    fi

    echo "%{T6}%{F#2193ff} %{T-}"
  fi
}

function toggle_bluetooth {
  if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
    bluetoothctl power on
  else
    bluetoothctl power off
  fi
}

case "$1" in
  toggle)
    toggle_bluetooth;;

  *)
    app;;

esac;

exit 0;
