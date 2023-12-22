#!/bin/bash

while true; do
    choice=$(whiptail --title "DBMS" --menu "Select operation (or enter 'exit' to quit):" 15 50 5 \
        "1" "Create Database" \
        "2" "Rename Database" \
        "3" "Drop Database" \
        "4" "Connect to DB" \
        "5" "Exit" \
        3>&1 1>&2 2>&3)

    case $choice in
        1 )
            dbname=$(whiptail --inputbox "Enter DB Name:" 8 50 --title "Create Database" 3>&1 1>&2 2>&3)
            exit_status=$?
            if [ $exit_status -eq 0 ]; then
                bash dbactions/createdb.sh "$dbname"
            fi
            ;;
        2 )
            bash dbactions/renamedb.sh
            ;;
        3 )
            bash dbactions/dropdb.sh
            ;;
        4 )
            bash ConnectDb.sh
            ;;
        5 )
            whiptail --title "Exit" --msgbox "Exiting the script." 8 50
            exit 0
            ;;
        * )
            whiptail --title "Error" --msgbox "Invalid option. Please choose a valid option." 8 50
            ;;
    esac
done

