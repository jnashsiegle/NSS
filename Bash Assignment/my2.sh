#!/bin/bash
# This is the second part of the lynda.com Tutorials Up and Running with Bash and the my.sh file
bold=$(tput bold)
normal=$(tput sgr0)
declare -A myarray
myarray[color]=blue
myarray["office building"]="HQ West"

echo ${myarray["office building"]} is ${myarray[color]}
echo
i=1 #incrementing variable
while read f; do
	echo "Line $i: $f"  #adds Line 1, Line 2, Line 3 etc before each new line
	((i++))
done < file.txt
echo
cat << EndOfText
This is a
multiline
text string
EndOfText
echo
echo ${bold} "If Statements"${normal}
a=2
if [ $a -gt 4 ]; then
	echo $a is greater than 4!
else
	echo $a is not greater than 4!
fi
echo
a="This is my #1 string!"
if [[ $a =~ [0-9]+ ]]; then  #regular expressions are our friend
	echo "There are numbers in the string: $a"
else
	echo "There are no numbers in the string: $a"
fi

echo ${bold}"While Loop"${normal}
i=0
while [ $i -le 10 ]; do
	echo i:$i
	((i+=1))
done
echo ${bold}"Until Loop, counterpart to the while loop"${normal}
j=0
until [ $j -ge 10 ]; do
	echo j:$j
	((j+=1))
done
echo ${bold}"For Loops"${normal}
for i in 1 2 3
do
	echo echo $i
done
for i in {1..100}
do
	echo $i
done
for i in {1..100..2} #interval by 2's
do
	echo $i
done
#another example
for (( i=1; i<=10; i++ ))
do
	echo $i
done
echo ${bold}"Let's loop through an array"${normal}
arr=("apple" "banana" "cherry")
for i in ${arr[@]}
do
	echo $i
done
echo
echo ${bold}"Go to\my3.sh file for continued work"${normal}
echo

