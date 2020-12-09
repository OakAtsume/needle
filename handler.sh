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
2) SSL TCP handler
3) Scan for open Ports
4) Connect to TCP port
5) Connect to TCP port (SSL)
6) TCP NUKER (Not responsible)
7) Exit
8) make needle a executable file in /bin
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
  printf "Port: "
  read port
  printf "\n<===[CONSOLE]===>\n\n"
  ncat -l  -v -w 5 -p $Port --ssl
  echo "Connecting killed!"
  pause
  clear
  ;;
  3)
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
  4)
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
  5)
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
  6)
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
  7)
  echo "$star Exit"
  exit
  ;;
	8)
	if command -v shc &>/dev/null;
	then
		shc -r -f needle && echo "$grn$good Done!$end" || echo "$red$bad Failed!$end"

		echo -e "Run the following command: (optional)\n"
		echo -e "cp needle.x $HOME/needle"
		echo -e "rm needle.x"
		echo -e "cd $HOME"
		echo -e "mv needle /bin\n"
		echo -e "needle.x.c is a the C source code file."
		echo -e "You can get rid of it or keep it incase of the needle file getting Broken"
		echo -e "If it gets Broken you can just run"
		echo -e "gcc needle.x.c\n"
		echo -e "and just rename the a.out file as needle and push it to /bin or keep it on any location you wish."
		pause
		clear
	else
		echo "$red$bad Please run $packet shc$end"
	fi
	;;
esac

fi 

done
