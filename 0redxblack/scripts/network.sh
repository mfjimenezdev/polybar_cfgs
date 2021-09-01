#!/usr/bin/env bash

#################################
# Polybar Custom Network Module #
# github.com/mfjimenezdev       #
#################################

#Variables
ethernet=$(nmcli -t -f TYPE,CONNECTION device | grep ethernet | cut -d: -f2);
wireless=$(nmcli -t -f TYPE,CONNECTION device | grep wifi | cut -d: -f2);
icon=$(cat /tmp/polybar-module-network);
icon_wls="%{T6}%{T-}";
icon_eth="%{T6}%{T-}";
icon_bad="%{T6}%{T-}";


#Get adapter in use by priority
function getAdapter {
  if ! [[ -z $wireless ]]; then
    adapter=$icon_wls
  elif ! [[ -z $ethernet ]]; then
    adapter=$icon_eth
  else
    adapter=$icon_bad
  fi
}


#Get Network Details
function getDetails {
  getAdapter;
  if [ $adapter == $icon_wls ]; then
    echo "$icon %{T4}$wireless" > /tmp/polybar-module-network;
  elif ! [ $adapter == $icon_eth ]; then
    echo "$icon %{T4}No Connection!" > /tmp/polybar-module-network;
  fi
}


#Main app
function app {
  getAdapter;

  cat /tmp/polybar-module-network;
  echo $adapter > /tmp/polybar-module-network;
}

#Script Arguments
case "$1" in
  details)
    getDetails;;

  *)
    app;;

esac

exit 0;
