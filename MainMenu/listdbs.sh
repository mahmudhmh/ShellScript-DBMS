#!/bin/bash

db_dir="./data"

databases=$(ls -l "$db_dir" | grep "^d" | awk '{print $9}')

if [ -z "$databases" ]; then
    echo "No databases found."
else
    echo "Existing databases:"
    for db in $databases; do
        echo "- $db"
    done
fi
