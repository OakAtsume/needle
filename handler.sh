#!/bin/bash

source @imports/import1.sh
source @imports/packet-finder.sh




name="ncat"

if command -v $name &>/dev/null;
then
  printf "Checking for requirement ($name)..."
  sleep 1
  grn
  printf "$good\n"
  reset

else
  printf "Checking for requirement ($name)..."
  sleep 1
  red
  printf "$bad\n"
  reset
  red
  echo "Please run ($packet $name)!"
  reset
fi

name="nmap"
if command -v $name &>/dev/null;
then
  printf "Checking for requirement ($name)..."
  sleep 1
  grn
  printf "$good\n"
  reset

else
  printf "Checking for requirement ($name)..."
  sleep 1
  red
  printf "$bad\n"
  reset
  red
  echo "Please run ($packet $name)!"
  reset
fi

name="ping"
if command -v $name &>/dev/null;
then
  printf "Checking for requirement ($name)..."
  sleep 1
  grn
  printf "$good\n"
  reset

else
  printf "Checking for requirement ($name)..."
  sleep 1
  red
  printf "$bad\n"
  reset
  name="iputils-ping"
  red
  echo "Please run ($packet $name)!"
  reset
fi




while :
do
red
printf "\n
##::::'##::::'###::::'##::: ##:'########::'##:::::::'########:'########::
 ##:::: ##:::'## ##::: ###:: ##: ##.... ##: ##::::::: ##.....:: ##.... ##:
 ##:::: ##::'##:. ##:: ####: ##: ##:::: ##: ##::::::: ##::::::: ##:::: ##:
 #########:'##:::. ##: ## ## ##: ##:::: ##: ##::::::: ######::: ########::
 ##.... ##: #########: ##. ####: ##:::: ##: ##::::::: ##...:::: ##.. ##:::
 ##:::: ##: ##.... ##: ##:. ###: ##:::: ##: ##::::::: ##::::::: ##::. ##::
 ##:::: ##: ##:::: ##: ##::. ##: ########:: ########: ########: ##:::. ##:
..:::::..::..:::::..::..::::..::........:::........::........::..:::::..::\n\n"
reset

printf "
1) Normal TCP handler
2) Scan for open Ports
3) Connect to TCP port
4) Connect to TCP port (SSL)
5) TCP NUKER (Not responsible)
6) Exit
\n"
reset

printf "Handler: "
read handler

if [[ -z "$handler" ]];
then
clear
grn
printf "$star please enter a option\n"
reset

else
case $handler in 
  1) printf "Port: "
  read Port
  printf "\n<===[CONSOLE]===>\n\n"
  ncat -l  -v -w 5 -p $Port
  echo "Connecting killed!"
  pause
  clear
  ;;
  2)
  printf "Target: "
  read Target
  printf "\n<===[CONSOLE]===>\n\n"
  mag
  printf "\n<===[PING]===>\n\n"
  ping -c 5 $Target
  printf "\n<===[NMAP]===>\n\n"
  nmap $Target | tail -n +5 | head -n -3 
  printf "\n<===[END]===>\n\n"
  reset
  pause
  clear
  ;;
  3)
  printf "Target: "
  read Target
  printf "Port: "
  read Port
  echo "Connecting..."
  echo "IP: $Target"
  echo "PORT: $Port"
  nc -w 5 $Target $Port
  echo "Connecting killed!"
  pause
  clear
  ;;
  4)
   printf "Target: "
  read Target
  printf "Port: "
  read Port
  echo "Connecting with ssl..."
  echo "IP: $Target"
  echo "PORT: $Port"
  nc -w 5 $Target $Port --ssl
  echo "Connecting killed!"
  pause
  clear
  ;;
  5)
  printf "TCP NUKER (Because why not :3 )\n"
  printf "Target: "
  read Target
  printf "Message_to_nuke_with: "
  read nuke

   printf "\n<===[TCP_PORT_NUKER]===>\n\n"
  red 
  echo "This will nuke the device (1-99999) scan"
  reset
  for i in {1..99999}
  do
        yel
        echo "TRYING CONNECTION ON $Target ON PORT $i"
        reset
        echo "$nuke" | nc  -w 10 $Target $i
  done
  pause
  clear
  ;;
  6)
  echo "$star Exit"
  exit
  ;;
esac

fi 

done
