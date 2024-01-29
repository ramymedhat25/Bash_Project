#!/usr/bin/bash
shopt -s extglob
echo "---------------------------------"
#check if there is tables
if [ -z "$(ls -A ~/dbproject/.db/$1)" ]; then
    echo "there is no tables to isert in"
echo "---------------------------------"
else
echo "---------------------------------"
echo "--> existing tables :"
    ls -F ~/dbproject/.db/$1
echo "---------------------------------"
   read -p "enter table name you want to select from : " tableName
if [[ -f ~/dbproject/.db/$1/$tableName ]];then
select var in "select all" "Select Rows where a Column equals a Value" "Select Specific Column(s)"
do
case $REPLY in 
1)
   sed -n '3,$p' $tableName
;;
2)
    echo "Enter the column number:"
    read column
    echo "Enter the value to match:"
    read value
    awk -F, -v col="$column" -v val="$value" '{if ($col == val) print $0}' "$tableName"
;;
3)
    echo "Enter the column numbers (comma-separated):"
    read columns
    cut -d, -f"$columns" "$tableName"
;;
*)
    echo "wrong choice plz choose number from 1 to 3"
;;
esac
done

else
    echo "sorry table [$tableName] doesn't exist"
fi 
fi