#!/bin/bash
#This is a basic bash script.
bold=$(tput bold)
normal=$(tput sgr0)
greeting="hello"

echo $greeting, world \(planet\)!

echo '$greeting, world (planet)!'

echo "$greeting, world (planet)!"

echo
echo
echo
a=Hello
b="good Morning"
c=16

echo $a
echo $b
echo $c

echo
echo
echo "$b!  I have $c apples."

echo
echo ${bold} "Command Substitution"${normal}
d=$(pwd)
echo $d

a=$(ping -c 1 example.com | grep 'bytes from'| cut -d = -f 4)
echo "The ping was $a"
echo
echo
echo Arithmetic
echo
d=2
e=$((d+2))
echo $e
echo
((e++))
echo $e
((e--))
echo $e
echo
((e+=5))
echo $e
((e*=3))
echo $e
((e/=3))
echo $e
((e-=5))
echo $e
echo 
echo
f=$((1/3))
echo $f
echo
#g=$(echo 1/3 | bc -l)
#echo $g
#(unsure why the above bc command is not working
echo
echo ${bold}"Comparisons"${normal}
[[ "cat" == "cat" ]]
echo $?
[[ "cat" == "dog" ]]
echo $?
echo
[[ 20 -gt 100 ]]
echo $?
echo
a=""
b="cat"
[[ -z $a && -n $b ]]
echo $?
echo
echo "Error Message"
echo -e "\033[5;31;40mERROR: \033[0m\033[31;40mSomething went wrong.\033[0m"
echo
echo "Broken out into a variable Error Message"
flashred=$(tput setab 0; tput setaf 1; tput blink)
red=$(tput setab 0; tput setaf 1)
#reset string follows
none=$(tput sgr0)
echo -e $flashred"ERROR: "$none$red"Something went wrong."$none
echo
echo "Date"
today=$(date +"%d-%m-%Y")
time=$(date +"%H:%M:%S")
printf -v d "Current User:\t%s\nDate:\t\t%s @ %s\n" $USER $today $time
echo "$d" #using quotes preserves the new lines
a=()
b=("apple" "banana" "cherry")
echo ${b[2]} #0-based array
b[5]="kiwi"
b+=("mango")
echo ${b[@]} #@ is for the whole array
echo ${b[@]: -1}
