#!/usr/bin/bash
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
   read -p "enter table name you want to select from : " filename
if [[ -f ~/dbproject/.db/$1/$filename ]];then
select var in "Delete All" "Delete by ID" "Delete by Column"
do
case $REPLY in 
1)
   read -p "Are you sure you want to delete all data? (y/n): " confirm
    if [[ "$confirm" =~ ^(y|yes)$ ]]; then
        > "$filename"  
        echo "All data deleted successfully."
    else
        echo "Deletion cancelled."
    fi
;;
2)
    echo "Enter the ID to delete:"
        read id
        awk -F, -v id="$id" '$1 != id' "$filename" > temp && mv temp "$filename"
        echo "Data with ID $id deleted."
;;
3)
    echo "Enter the column number to delete:"
    read colnum
    awk -F, -v col="$colnum" '{
        for (i=1; i<=NF; i++) {
            if (i != col) printf "%s%s", $i, (i==NF ? "\n" : FS)
        }
    }' "$filename" > temp && mv temp "$filename"
    echo "Column $colnum deleted."
;;
*)
    echo "wrong choice plz choose number from 1 to 3"
;;
esac
done

else
    echo "sorry table [$filename] doesn't exist"
fi 
fi