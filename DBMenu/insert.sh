#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <database>"
    exit 1
fi

database="$1"
table_path="data/$database"

if [ ! -d "$table_path" ]; then
    echo "Database '$database' does not exist."
    exit 1
fi

echo "Available tables in $database:"
ls "$table_path"
read -p "Enter table Name: " table_name

table_file="$table_path/$table_name"

if [ -f "$table_file" ]; then
    num_fields=$(awk -F: 'NR==1{print NF}' "$table_file")

    for ((i = 1; i <= num_fields; i++)); do
        colname=$(awk -F: -v "i=$i" 'NR==1{print $i}' "$table_file")
        coltype=$(awk -F: -v "i=$i" 'NR==1{print $i}' "$table_path/$table_name.tp")
        flag=0

        while [ $flag -eq 0 ]; do
            read -p "Enter $colname: " value
            if { [ "$coltype" = "int" ] && [[ "$value" =~ ^[0-9]+$ ]]; } ||
               { [ "$coltype" = "string" ] && [[ "$value" =~ ^[a-zA-Z]+$ ]]; }; then
                if [ $i -ne $num_fields ]; then
                    echo -n "$value:" >> "$table_file"
                else
                    echo "$value" >> "$table_file"
                fi
                flag=1
            fi
        done
    done
    echo "Record inserted successfully."
else
    echo "Table '$table_name' doesn't exist."
fi

