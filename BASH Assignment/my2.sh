#!/bin/bash
# This is the second part of the lynda.com Tutorials Up and Running with Bash and the my.sh file
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
