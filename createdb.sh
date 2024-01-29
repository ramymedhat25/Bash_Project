#!/usr/bin/bash
while true
do
read -p "enter db name : " name
if [[ "$name" == "00" ]]; then
        break
fi
if [[ ! -d ~/dbproject/.db/$name ]];then
case $name in
[0-9]*)
    echo "database name can't start with number"
    continue
;; 
*[[:space:]]*) 
    # i used tr -s to replace one space or more with only one _ 
    newname=$(echo "$name" | tr -s ' ' | tr ' ' '_')
    while true
    do
    read -p "spaces not acceptable rapalce name by [$newname] ? (y/n) : " choice
    case $choice in
        'y' )     
            mkdir ~/dbproject/.db/"$newname"
            echo "database [$newname] created successfully"
            break 2
        ;;
        'n' ) 
            echo "database [$name] canceled"
            break
        ;;
        *)
            echo "wrong choice plz choose y or n"
            continue
        ;;
    esac
    done
;;
[a-zA-Z]*)
    mkdir ~/dbproject/.db/$name
    echo "database [$name] created successfully"
    break
;;
*)
    echo "database [$name] is in wrong format"
    continue
;;
esac  
else
    echo "database name is empty or already exist"
    break
fi
done
  