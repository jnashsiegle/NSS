#!/bin/bash
# This is part 5 of my basic bash script
bold=$(tput bold)
normal=$(tput sgr0)
#echo ${bold}User Interactions${normal}
#echo ${bold}Let\'s explore getopts${normal}
#while getopts u:p:ab option; do
#	case $option in
#		u) user=$OPTARG;;
#		p) pass=$OPTARG;;
#		a) echo "Got the A flag";;
#		b) echo "Got the B flag";; #we just want to know if the a/b flags were used
#	esac
#done

#echo "User: $user / Pass: $pass"
echo
echo ${bold}"Another alternative, putting a colon before the first flag see comments"${normal}
while getopts :u:p:ab option; do    #tells bash that I want to know about flags at the command line not specified
        case $option in
                u) user=$OPTARG;;
                p) pass=$OPTARG;;
                a) echo "Got the A flag";;
                b) echo "Got the B flag";; #we just want to know if the a/b flags were used
		?) echo "I don't know what $OPTARG is";;
	 esac
done

echo "User: $user / Pass: $pass"
echo
echo
echo "What is your name?"
read name

echo "What is your password?"
read -s pass

read -p "What's your favorite animal?" animal

echo name: $name, pass: $pass, animal: $animal
echo
echo ${bold}"Let\'s use a menu"${normal}
echo
select animal1 in "cat" "dog" "bird" "fish"
do
	echo "You selected $animal1!"
	break
done
echo
echo ${bold}"Let's use a case option"${normal}
select option in "banana" "cherry" "quit"
do
	case $option in
		banana) echo "Bananas are high in potassium.";;
		cherry) echo "Cherries are very sweet!";;
		quit) break;;
		*) echo "I'm not sure what that is." ;
	esac
done;
echo
echo ${bold}Error Handling${normal}
if [ $# -lt 3 ]; then  #sets up to require three arguments input
	cat <<- EOM
	This command requires three arguments:
	username, userid, and favorite number.
	EOM
else
	# the program goes here
	echo "Username: $1"
	echo "UserID: $2"
	echo "Favorite Number: $3"
fi
echo ${bold}"Or we can do it with a loop"${normal}
read -p "Favorite animal? " a
while [[ -z "$a" ]]; do
	read -p "I need an answer! " a
done
echo "$a was selected."
echo
echo ${bold}But let's set a default answer so it doesn't seem so needy if left blank${normal}
read -p "Favorite fruit? [apple] " a
while [[ -z "$a" ]]; do
	a="apple"
done
echo "$a was selected."
echo
echo ${bold}Basic validation${normal}
read -p "What year? [nnnn] " a
while [[ ! $a =~ [0-9]{4} ]]; do
	read -p "A year, please! [nnnn] " a
done
echo "Selected year: $a"
