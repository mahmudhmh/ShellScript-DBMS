#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <database>"
    exit 1
fi

database="$1"
tables_directory="data/$database"

if [ ! -d "$tables_directory" ]; then
    echo "Database '$database' not found."
    exit 1
fi

echo "Available tables in $database:"
ls "$tables_directory"

read -p "Enter table Name: " updtb

if [ ! -f "$tables_directory/$updtb" ]; then
    echo "$updtb doesn't exist"
    exit 1
fi

awk -F: 'NR==1{print $0}' "$tables_directory/$updtb"

read -p "Enter column to be updated: " colupd
read -p "Enter new value: " vl
read -p "Enter the column (where): " wherecl
read -p "Enter the value: " wherevl

if [ -z "$colupd" ] || [ -z "$vl" ] || [ -z "$wherecl" ] || [ -z "$wherevl" ]; then
    echo "All input fields must be filled."
    exit 1
fi

awk -F: -v colupd="$colupd" -v vl="$vl" -v wherecl="$wherecl" -v wherevl="$wherevl" '
NR == 1 {
    for (i = 1; i <= NF; i++) {
        if ($i == colupd) {
            var = i
        } else if ($i == wherecl) {
            vaa = i
        }
    }
    print
    next
}
$vaa == wherevl {
    $var = vl
}
1' "$tables_directory/$updtb" > tmp && mv tmp "$tables_directory/$updtb"


echo "Update complete!"
