#!/bin/bash

function set(){
  packet="$output"
}

function install(){
  $packet  
}

if command -v apt &>/dev/null;
then
  output="apt install "
fi

if command -v pkg &>/dev/null;
then
  
  output="pkg install "
fi

if command -v yum &>/dev/null;
then
  output="yum install "
fi

if command -v pacman &>/dev/null;
then
  output="pacman -C  "
fi

set

 
