#!/usr/bin/bash
echo "---------------------------------"
echo "--> existing database : "
   ls -F ~/dbproject/.db | grep / | tr '/' ' '
echo "---------------------------------"
read -p "enter database name to connect : " name
if [[ "$name" == "00" ]]; then
       source ./dbrun.sh
fi
if [[ -d ~/dbproject/.db/$name ]];then 
    echo "Connect to $name ...."
    source tables.sh $name
else 
    echo "Sorry I can't find [$name] database"
fi 