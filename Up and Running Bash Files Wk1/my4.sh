#!/bin/bash
# This is part 4 of my basic bash script.
bold=$(tput bold)
normal=$(tput sgr0)
echo ${bold}Arguments - User Interaction ${normal}
echo
echo $1
echo $2
echo
for i in $@
do
	echo $i
done
echo "There were $# arguments."
echo


