#!/bin/bash
while :
do

clear
#check for root
if [ `whoami` != 'root' ]
  then
    echo "Please run as root"
    exit 0
fi

#netcat & tcp backdoor handler
source ./@imports/import1.sh 
source ./@imports/packet-finder.sh


printf "\e[32m
██╗  ██╗ █████╗ ███╗   ██╗██████╗ ██╗     ███████╗██████╗ 
██║  ██║██╔══██╗████╗  ██║██╔══██╗██║     ██╔════╝██╔══██╗
███████║███████║██╔██╗ ██║██║  ██║██║     █████╗  ██████╔╝
██╔══██║██╔══██║██║╚██╗██║██║  ██║██║     ██╔══╝  ██╔══██╗
██║  ██║██║  ██║██║ ╚████║██████╔╝███████╗███████╗██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝\n"
install nmap &>/dev/null
install netcat &>/dev/null
install ncat &>/dev/null 
red
echo "Requiremnts Installed!"
reset
blue
echo "(1) Start ~~> start normal TCP handler"
echo "(2) scan ~~> Scan target for open ports"
echo "(3) Connect ~~> connect to target [Bind backdoor]"
echo "(4) Force ~~> Try to bind to range of ports"
echo "(5) Exit ~~> Exit handler"
reset 

grn
read -p "[Handler]~~> " handler
reset

if [ -z "$handler" ];
then
  empty
else
  if [ $handler == "1" ];
  then
    echo "Enter the port to lisent for"
    read -p  "[Port]~~> " port
    yel
    clear

    red 
    echo "Message from Oak: Please stay in legal Barriers!"
    sleep 2
    reset

    clear
    echo "Starting TCP handler"
    reset
    blue
    echo "Press ^C to exit "
    reset
    grn

    echo "[======================================]"
    echo "[===============(CONSOLE)==============]"
    echo "[======================================]"
    reset
    con
    nc -lvkp $port
    echo "[======================================]"
    echo "[======================================]"
    pause
    reset
    
    echo "Task terminated!"
    exit 0
  fi
  
  if [ $handler == "2" ];
  then
  	read -p "[TARGET]~~> " target
  	yel
  	clear
  	red
  	echo "Message from Oak: Please stay in legal Barriers!"
  	sleep 2
  	reset
  	
  	clear
  	echo "Starting TCP port scanner"
  	reset
  	blue
  	echo "Press ^C to exit"
  	reset
  	grn
  	
	echo "[======================================]"
  	echo "[===============(CONSOLE)==============]"
  	echo "[======================================]"
  	reset
  	con
  	nmap $target
  	echo "[======================================]"
  	echo "[======================================]"
  	pause
  	clear
  	fi
  	
  if [ $handler == "3" ];
  then
  	read -p "[Connect_host]~~> " connect_host
  	read -p "[Connect_port]~~> " connect_port
   	yel
  	clear
  	red
  	echo "Message from Oak: Please stay in legal Barriers!"
  	sleep 2
  	reset
  	
  	clear
  	echo "Trying to connect to ($connect_host) on port ($connect_port)"
  	reset
  	blue
  	echo "Press ^C to exit"
  	reset
  	grn
  	
  	echo "[======================================]"
  	echo "[===============(CONSOLE)==============]"
  	echo "[======================================]"
  	reset
  	con
  	nc $connect_host $connect_port
  	echo "[======================================]"
  	echo "[======================================]"
  	pause
  	clear
  	fi
  	
  	if [ $handler == "4" ];
  	then
  	
  	read -p "[Connect_host]~~> " connect_host
  	read -p "[Start_port]~~> " start
  	read -p "[Stop_port]~~> " stop
  	
  	yel
  	clear
  	red
  	echo "Message from Oak: Please stay in legal Barriers!"
  	sleep  2
  	reset
  	for range in {$start..$stop}; do echo "range"; done
  	clear
  	echo "Trying to connect to ($connect_host) on ports ($start - $stop)"
  	echo "No (DNS)"
  	netcat -z -n -w 3 -v $connect_host $start-$stop 2>&1 | grep succeeded
  	pause
  	clear

  	fi
  	
  	if [ $handler == "5" ];
  	then
  	echo "Thank you for using needle-kit!"
  	exit 0
  	fi
fi
    
done



