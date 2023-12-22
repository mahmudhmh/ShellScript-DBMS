#!/bin/bash

read -p "Enter Table Name: " tbname

if [[ -f data/$1/$tbname ]]; then
    echo "Table $tbname already exists";
else
    touch data/$1/$tbname;
    read -p "Enter No of columns :" n;

    # Array to keep track of whether each column is a PK
    declare -a is_pk

    for (( i = 1; i <= n; i++ )); do
        read -p "Enter column $i name :" name;
        read -p "Enter column datatype : [string/int]" dtype;
        
        while [[ "$dtype" != *(int)*(string) || -z "$dtype" ]]; do
            echo "Invalid datatype";
            read -p "Enter column datatype : [string/int]" dtype;
        done

        read -p "Do you want this column to be a primary key? [y/n]: " is_pk_choice

        # Validate user input for PK choice
        while [[ "$is_pk_choice" != [yYnN] ]]; do
            echo "Invalid choice. Please enter 'y' or 'n'."
            read -p "Do you want this column to be a primary key? [y/n]: " is_pk_choice
        done

        if [[ "$is_pk_choice" == [yY] ]]; then
            if [[ "${is_pk[*]}" =~ "1" ]]; then
                echo "Error: Only one column can be chosen as the primary key."
                exit 1
            fi
            is_pk[i]=1
        else
            is_pk[i]=0
        fi

        if [[ i -eq n ]]; then
            echo  $name >> data/$1/$tbname;
            echo  $dtype >> data/$1/$tbname.tp;
            echo  ${is_pk[i]} >> data/$1/$tbname.pk;

        else
            echo -n $name":" >> data/$1/$tbname;
            echo -n $dtype":" >> data/$1/$tbname.tp;
            echo -n ${is_pk[i]}":" >> data/$1/$tbname.pk;
        fi
    done

    echo "$tbname has been created"
fi

