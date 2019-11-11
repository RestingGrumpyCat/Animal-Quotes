#!/bin/bash

#Student Name: Shiyu Wang

# This script prints certain animal image saying different quotes; quotes are from standard input if given, otherwise the animal would say a random line from a file 


if [ "$#" -lt 1 ]; then  #error check for if enough argument is given
	echo "Error: Need at least one argument."
	echo
	exit 1
fi

animal=$1
 
if [[ $animal != "cat" && "$animal" != "dog" && "$animal" != "cow" && "$animal" != "duck" && "$animal" != "frog" ]]; then #error checking for if the animal is available
	
	echo "Error: Animal must be one of dog, cat, cow, duck or frog."
	echo 
	exit 1

fi


shift #shift so that $* contains only the line argument
line="$*" #get the line animal will say if given
size=${#line} 
echo

if [ $# -gt 1 ] || [ $# -eq 1 ]; then  #check if the user has input a line, if he/she does, prints format and input line 

	echo -n "**" | tr "*" " " #print correct format for the bubble	
	while [ $size -gt 0 ]; do
       		echo -n " " | tr " " "-"
		size=$((size-1))
	done
	echo

	echo -n "< "
	echo -n "$line" 
	echo " >"

	size=${#line}

        echo -n "**" | tr "*" " "
	while [ $size -gt 0 ]; do
        	echo -n " " | tr " " "____"
        	size=$((size-1))
	done
	echo

else #if no input line is given, the script choose a random line from a txt file then use it as the animal quote
	
	cat /cs2211/a2/fortunes.txt | shuf -n 1 > shuf.txt # use shuf to generate one random line, then save the output to shuf.txt

	number=`wc -m shuf.txt | tr -d "shuf.txt" | tr -d " "` #get the char count from wc, then remove part of the output to get a number for the loop after 

        echo -n "**" | tr "*" " " #print correct format for bubble
	while [ $number -gt 0 ]; do
		echo -n " " | tr " " "-"
		number=$((number-1))	
	done 
	echo 
  	echo -n "< "
	cat shuf.txt | tr "\n" " " 
	echo -n " >"
	echo

        number=`wc -m shuf.txt | tr -d "shuf.txt" | tr -d " "` #recount the number of char since number has been decremented in the previous loop
 
        echo -n "**" | tr "*" " "
	while [ $number -gt 0 ]; do
                
                echo -n " " | tr " " "____"
        	number=$((number-1))
	done

	echo " "
fi

case $animal in #case statement to print animal image from files as the requirement indicates
	cat) 
		cat /cs2211/a2/cat.txt
		;;
	frog) 
		cat /cs2211/a2/frog.txt
		;;
	dog)
		cat /cs2211/a2/dog.txt
		;;
	duck)
		cat /cs2211/a2/duck.txt
		;;
	cow)
		cat /cs2211/a2/cow.txt
		;;
esac

echo
echo 
