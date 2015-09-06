
#!/bin/bash
# This is the third part of my basic bash script examples
bold=$(tput bold)
normal=$(tput sgr0)
echo ${bold} "Associative Array"${normal}
declare -A arr
arr["name"]="Jana"
arr["id"]="1234"
for i in "${!arr[@]}"
do
	echo "$i: ${arr[$i]}"
done

echo ${bold} "Command Substitution"${normal}
for i in $(ls)
do
	echo "$i"
done
echo
echo ${bold}"Case statements"${normal}
a="bird"
case $a in
	cat) echo "Feline";;
	dog|puppy) echo "Canine";;
	*) echo "No Match!";;
esac
echo
echo ${bold}Functions${normal}
function greet {
	echo "Hi there!" #create the function
}
echo "And now, a greeting!"
greet #call the function
echo
function greet {
	echo "Hi, $1"
}
echo "And now a greeting with an argument passed in!"
greet Jana
echo
function greet {
	echo "Hello, $2"
}
echo "What if we use more than one argument?" 
greet Jana Scott Chris
echo
function greet {
	echo "Hi, $1! What a nice $2!"
}
echo "And now a 2 part greeting!"
greet Jana Morning
greet Everybody Evening
echo
echo
function numberthings {
	i=1
	for f in $@; do
		echo $i: $f
		((i+-1))
	done
}

numberthings $(ls)

numberthings pine birch maple spruce

