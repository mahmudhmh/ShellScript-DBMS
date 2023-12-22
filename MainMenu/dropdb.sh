#!/bin/bash
echo "Available DataBases"
ls -1 data/
read -p "Enter DataBase Name: " dropname
if [[ -d data/$dropname ]]; then
	echo "Are you Sure You Want To drop $dropname Database? y/n"
	read choice;
	case $choice in
		 [Yy]* ) 
			rm -r data/$dropname
			echo "$dropname has been deleted"
			;;
		 [Nn]* ) 
			echo "Operation Canceled"
			;;
		* ) 
			echo "Invalid Input 0 DataBases changed"
			;;
	esac
else
	echo "$dropname doesn't exist"
fi




