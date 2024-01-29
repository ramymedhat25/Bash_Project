#!/usr/bin/bash
echo "---------------------------------"
echo "--> existing database : "
   ls -F ~/dbproject/.db | grep / | tr '/' ' '
echo "---------------------------------"
   read -p "enter db name you want to drop : " name
   if [[ "$name" == "00" ]]; then
       source ./dbrun.sh
    fi
    if [[ -d ~/dbproject/.db/$name ]];then
        rm -r ~/dbproject/.db/$name
        echo "db [$name] deleted ...."
        echo "---------------------------------"
        echo "--> updated database : "
        ls -F ~/dbproject/.db | grep / | tr '/' ' '
        
    else
        echo "sorry db [$name] doesn't exist"
    fi 
   echo "---------------------------------"