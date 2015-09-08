
#!/bin/bash
#|sort |uniq -c |sort -n  add to cat $1 | awk '{print $1}' |
# if need to list ip's

bold=$(tput bold)
normal=$(tput sgr0)

grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" $1 |
 awk '{print $1}' |sort |uniq  |sort -n 
#awk '{ print $1 } '$1  | sort | uniq -c |  wc -l
echo  "End Unique IP Addresses"
echo


# List out successful ssh login attempts
cat $1 | grep  'Accepted' | awk '{print $1 " " $2 " " $3 " User: " $9 " " }'
cat $1 | sort | grep  'Accepted' | awk '{print $1 " " $2 " " $3 " User: " $9 " IP:" $11 }'
echo
# List out successful ssh login attempts from sudo users
cat $1 | grep -c  'session opened for user root' | awk '{print $1 " " $2 " " $3 " Sudo User: " $13 " " }'
echo ${bold} "Super User Counts"${normal}
echo
# List out ssh login attempts from non-existing and unauthorized user accounts
cat $1 | grep -c 'Invalid user'
echo ${bold} "Invalid users"${normal}
echo
# List out ssh login attempts by authorized ssh accounts with failed password
cat $1 | sort  |  grep -v  invalid | grep -c 'Failed password'
echo ${bold} "Failed Passwords" ${normal}
echo
# List out ssh Break - In attempts
cat $1 | sort | grep -c 'POSSIBLE BREAK-IN ATTEMPT!'
echo ${bold} "Break - In Attempts" ${normal}

#echo ${bold} "Error Message Count"${normal}
#cat $1| awk '{print $8}' |sort |uniq -c |sort -n 
#awk '{ print $8 } ' $1 | sort | uniq |  wc -l
#echo "EO Error"
echo



#echo ${bold} "Head and Tails"${normal}
#head -n 1 $1
#tail -n 1 $1
