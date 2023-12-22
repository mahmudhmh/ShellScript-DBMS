#!/bin/bash

if [ ! -d data ]; then
    mkdir data
fi

if [ -d data/$1 ]; then
    echo "The Database $1 Already Exists";
else

    mkdir data/$1
    echo "Database $1 created successfully"
fi

