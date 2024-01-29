#!/usr/bin/bash

echo "---------------------------------"
#check if the directory is empty
if [ -z "$(ls -A ~/dbproject/.db/$1)" ]; then
    echo "there is no tables yet"
else
    echo "--> existing tables :"
    ls -F ~/dbproject/.db/$1
fi

echo "---------------------------------"
