#!/bin/bash
echo "Available DataBases"
ls -1 data/
read -p "Enter DataBase: " dbname
read -p "Enter New Name: " dbnew
mv data/$dbname data/$dbnew
