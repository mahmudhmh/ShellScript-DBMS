#!/bin/bash
echo "Available DataBases"
ls -1 data/
read -p "Enter DataBase Name: " db
if [[ -d data/$db ]]; then
    while true; do
        select varuse in "create table" "drop table" "update table" "insert record" "Delete from table" "Select from table" "List all tables" "Exit"
        do
            case $varuse in
                "create table" )
                    bash DBMenu/createtable.sh $db
                    ;;
                "drop table" )
                    bash DBMenu/droptable.sh $db
                    ;;
                "update table" )
                    bash DBMenu/updatetable.sh $db
                    ;;
                "insert record")
                    bash DBMenu/insert.sh $db
                    ;;
                "Delete from table" )
                    bash DBMenu/deleterec.sh $db
                    ;;
                "Select from table" )
                    bash DBMenu/selectrec.sh $db
                    ;;
                "List all tables" )
                    bash DBMenu/listtables.sh $db
                    ;;
                "Exit" )
                    echo "Exiting the script."
                    exit
                    ;;
                * ) echo "Invalid option. Please select again.";;
            esac
        done
    done
else
    echo "$db isn't a DataBase";
fi

