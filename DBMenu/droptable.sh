#!/bin/bash
echo "Available tables in $1"
ls data/$1
read -p "Enter table Name: " dropt
if [[ -f data/$1/$dropt ]]; then
	echo "Are you Sure You Want To drop $dropt table? y/n"
	read choice;
	case $choice in
		 [Yy]* ) 
			rm data/$1/$dropt
			rm data/$1/$dropt.tp 
			rm data/$1/$dropt.pk
			echo "$dropt has been deleted"
			;;
		 [Nn]* ) 
			echo "Operation Canceled"
			;;
		* ) 
			echo "Invalid Input 0 tables effected"
			;;
	esac
else
	echo "$dropt doesn't exist"
fi
