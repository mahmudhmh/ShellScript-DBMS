#!/bin/bash

echo "Available tables in $1"
ls data/$1
read -p "Enter table Name: " seltb

select choice in "Select all columns" "select specific columns" "Go back"
do
    case $choice in
        "Select all columns") 
            awk -F: '{print}' data/$1/$seltb
            ;;
        "select specific columns")
            read -p "Enter Number of columns: " number
            for (( i = 1; i <= number; i++ )); do
                read -p "Enter column $i: " colname
                awk -F: '{
                    if(NR==1) {
                        for(i=1; i<=NF; i++) {
                            if($i=="'$colname'") {
                                var=i
                                break
                            }
                        }
                    } 
                    {print $var}
                }' data/$1/$seltb
            done
            ;;
        "Go back") 
            break
            ;;
        *) 
            echo "Invalid option. Please try again."
            ;;
    esac
done

