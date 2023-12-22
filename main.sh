#!/bin/bash

while true; do

    myvar=$(whiptail --title "Database Management" --menu "Choose an action:" 15 50 5 \
        "1" "Create a new database" \
        "2" "Connect to database" \
        "3" "Rename a database" \
        "4" "Drop a database" \
        "5" "List databases" \
        "6" "Exit" \
        3>&1 1>&2 2>&3)

    if [ $? -ne 0 ] || [ "$myvar" == "6" ]; then
        exit
    fi

    case $myvar in
        "1")
            read -p "Enter DB Name: " dbname
            bash MainMenu/createdb.sh "$dbname"
            ;;
         "2")
            bash connectdb.sh
            ;;
        "3")
            bash MainMenu/renamedb.sh
            ;;
        "4")
            bash MainMenu/dropdb.sh
            ;;
        "5")
            bash MainMenu/listdbs.sh
            ;;
        *)
            echo "Unknown option: $myvar"
            exit
            ;;
    esac
done

