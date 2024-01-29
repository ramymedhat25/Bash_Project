#!/usr/bin/bash

echo "---------------------------------"
#check if there is tables
if [ -z "$(ls -A ~/dbproject/.db/$1)" ]; then
    echo "there is no tables to drop"
echo "---------------------------------"
else
echo "---------------------------------"
echo "--> existing tables :"
    ls -F ~/dbproject/.db/$1
echo "---------------------------------"
   read -p "enter table name you want to drop : " name
    if [[ -f ~/dbproject/.db/$1/$name ]];then
        rm ~/dbproject/.db/$1/$name
        echo "table [$name] deleted ...."
        echo "---------------------------------"
        echo "--> updated table : "
        ls -F ~/dbproject/.db/$1
        echo "---------------------------------"
    else
        echo "sorry table [$name] doesn't exist"
    fi 
fi
