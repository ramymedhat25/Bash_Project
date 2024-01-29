#!/usr/bin/bash
#for global pattern in line 83
shopt -s extglob 

while true
do
read -p "enter table name : " name
if [[ ! -f ~/dbproject/.db/$1/$name ]];then
case $name in
*[[:space:]]*)  
    newname=$(echo "$name" | tr -s ' ' | tr ' ' '_')
    while true
    do
    read -p "spaces not acceptable rapalce name by [$newname] ? (y/n) : " choice
    case $choice in
        'y' )     
            touch ~/dbproject/.db/$1/"$newname"
            echo "table [$newname] created successfully"
            break 2
        ;;
        'n' ) 
            echo "table [$name] canceled"
            break
        ;;
        *)
            echo "wrong choice plz choose y or n"
            continue
        ;;
    esac
    done
;;
[0-9]*)
    echo "table name can't start with number"
    continue
;; 
[a-zA-Z]*)
    touch ~/dbproject/.db/$1/$name
    echo "table [$name] created successfully"
    break
;;
'')
    echo "table name can't be empty"
    continue
;;
*)
    echo "table [$name] is in wrong format"
    continue
;;
esac  
else
    echo "table name is already exist"
    source ../../tables.sh
fi
done


while true
do 
read -p "enter feilds number of table: " fields
if [[ "$fields" == "0" ]]; then
    echo "fields number should not be zero"
    continue
fi
case $fields in
# + is global pattern mean one or more
+([0-9]) )
    echo "your table has $fields fields"
	break
;;
* )
    echo "wrong choice plz write a number"
	continue
;;

esac
done

#reseting variable value to prevnent merging first table data with the second one
row=""
type=""

#for meta data finally ^_^
colnames=()

for ((i=1;i<=$fields;i++))
do

while true
do 

read -p "column num $i name is: " meta
 
case $meta in
*[[:space:]]*)  
    echo "meta data can't contain spaces"
    continue
;;
[0-9]*)
    echo "meta data can't start with number"
    continue
;; 
[a-zA-Z]*)
    if [[ " ${colnames[@]} " =~ " $meta " ]]; then
        echo "column name $meta already exist"
        continue
    fi    
    colnames+=("$meta")      
    row+="$meta,"
    break
;;
'')
    echo "meta data can't be empty"
    continue
;;
*)
    echo "meta data [$meta] is in wrong format"
    continue
;;
esac
done
done

echo $row >> $name


for ((i=1;i<=$fields;i++))
do
echo "plz enter data type for $i column"
select var in "string" "integer"
do 
case $REPLY in 
1 )
	type+=string,
				break
;;
2) 
	type+=integer,
				break
;;
* )
    echo "wrong choice plz choose number from 1 or 2"
	continue
;;
esac
done 
done

echo $type>> $name


echo "table made successfully"
cat $name
source ../../tables.sh