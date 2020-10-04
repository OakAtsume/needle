#!/bin/bash
#injection.sh

blue
printf "
                                  █████ ████          
                                 ░░███ ░░███          
 ████████    ██████   ██████   ███████  ░███   ██████ 
░░███░░███  ███░░███ ███░░███ ███░░███  ░███  ███░░███
 ░███ ░███ ░███████ ░███████ ░███ ░███  ░███ ░███████ 
 ░███ ░███ ░███░░░  ░███░░░  ░███ ░███  ░███ ░███░░░  
 ████ █████░░██████ ░░██████ ░░████████ █████░░██████ 
░░░░ ░░░░░  ░░░░░░   ░░░░░░   ░░░░░░░░ ░░░░░  ░░░░░░\n"
reset
source ./@imports/import1.sh
source ./@imports/import2.sh 
source ./@imports/packet-finder.sh
#code injector
file_with_code="$2"
file_to_inject="$3"
extra2="$4"

case "$1" in
  h)
  printf "(Option 1 common)\n"
  printf "bash needle.sh 1 \"{text file}\" \"{File to inject}\" \n"
  printf " "
  printf "(Option 1 solve)\n"
  printf "bash needle.sh 1 \"{text file}\" \"{File to inject}\" solve \"{replace to}\" \"{keyword to replace to}\" \n"
  printf " "
  printf "(Option 2 common {only})\n"
  printf "bash needle.sh 2 \"{type the code here in \"\"} {file to inject}\" \n"
    ;;
  -help)
  printf "(Option 1 common)\n"
  printf "bash needle.sh 1 \"{text file}\" \"{File to inject}\" \n"
  printf " "
  printf "(Option 1 solve)\n"
  printf "bash needle.sh 1 \"{text file}\" \"{File to inject}\" solve \"{replace to}\" \"{keyword to replace to}\" \n"
  printf " "
  printf "(Option 2 common {only})\n"
  printf "bash needle.sh 2 \"{type the code here in \"\"} {file to inject}\" \n"
    ;;
  -h)
  printf "(Option 1 common)\n"
  printf "bash needle.sh 1 \"{text file}\" \"{File to inject}\" \n"
  printf " "
  printf "(Option 1 solve)\n"
  printf "bash needle.sh 1 \"{text file}\" \"{File to inject}\" solve \"{replace to}\" \"{keyword to replace to}\" \n"
  printf " "
  printf "(Option 2 common {only})\n"
  printf "bash needle.sh 2 \"{type the code here in \"\"} {file to inject}\" \n"
    ;;
esac
if [ $1 == "1" ];
then
  echo "File injector!"
  progress-bar 2
  echo "Reading the code..."
  progress-bar 3
  echo "Injecting the code..."
  progress-bar 5
  
  change_me="$5"
  change_me_to="$6"
  
  if [ $extra2 == "solve" ];
  then
    echo "Solve mode active"
    
    echo "Now replacing $5 with $6"
    
    sed -i "s/$change_me/$change_me_to/g" $file_to_inject
    
    echo "Done!"
    
  fi
  cat $file_with_code >> $file_to_inject
  echo "File injection finished!"
echo "[======================================]"
echo "[===============(CONSOLE)==============]"
echo "[======================================]"
echo $file_with_code
echo "[======================================]"
echo "[======================================]"
echo "Code injected to $file_to_inject"
fi



code="$2"
extra2="$4"

if [ $1 == "2" ];
then
  echo "File Injectior!"
  progress-bar 2
  echo "Injecting the code..."
  progress-bar 3
  echo $code >> $file_to_inject
  echo "Code injection finished!"
  progress-bar 1
  change_me="$7"
  change_me_to="$8"
  
  if [ $extra2 == "solve" ];
  then
    echo "Solve mode active"
    
    echo "Now replacing $5 with $6"
    
    sed -i "s/$change_me/$change_me_to/g" $file_to_inject
    
    echo "Done!"
    
  fi
  
  
echo "[======================================]"
echo "[===============(CONSOLE)==============]"
echo "[======================================]"
echo $code
echo "[======================================]"
echo "[======================================]"
echo "Code injected to $file_to_inject"
fi



#extra

