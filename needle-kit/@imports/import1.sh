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
console=$'\e[1m'
new=$'\n'
file="netcat"

function con(){
  printf $console
}
function yel(){
  printf $yel
}
function grn(){
        printf $grn
}

function blue(){
        printf $blu
}

function red(){
        printf $red
}

function reset(){
        printf $end
}

function yel() {
        printf $yel
}
function mag() {
        printf $mag
}

function empty(){
  echo "[ENTER]"
}