#!/bin/bash
#|sort |uniq -c |sort -n  add to cat $1 | awk '{print $1}' |
# if need to list ip's

bold=$(tput bold)
normal=$(tput sgr0)


echo ${bold} "Unique IP Addresses (add above if ip listing is needed)n"${normal}
cat $1 | awk '{print $8}' |sort |uniq |sort -n
awk '{ print $8 } ' $1  | sort | uniq |  wc -l
echo  "End Unique IP Addresses"
echo



#echo ${bold} "Largest Export File Size"${normal}
#cat $1|grep POST | awk '{print $6, $10}'
#awk '{ print $10 } ' $1 | sort -k2,2 | uniq |  wc -l
#echo "EO Export "
#echo 

echo ${bold} "Unique Dates"${normal}
cat $1 | awk '{print $2, $3, $5 }' |
awk  '{print $2, $3, $5}' | sort | uniq  | wc -l 
echo "EO unique dates"
echo

echo ${bold} "Head and Tails"${normal}
head -n 1 $1
tail -n 1 $1
echo 

echo ${bold} "Error Messages and Count"${normal}

sed -e "s/\[.*\]\([^:]*\)\(.*\)/\1/" $1 | sort | uniq -c
