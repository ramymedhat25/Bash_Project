#!/usr/bin/bash 
PS3="$1 >>"
cd ~/dbproject/.db/$1
select var in "create table" "list table" "drop table" "insert into table" "select from table" "delete from table" "update teble" "exit"
do 
case $REPLY in 
1)
   source ../../createtb.sh
;;
2)
   source ../../listtb.sh 
;;
3)
    source ../../droptb.sh
;;
4)
   source ../../inserttb.sh
;;
5)
   source ../../selecttb.sh
;;
6)
   source ../../deletetb.sh
;;
7)
   source ../../updatetb.sh
;;
8)
   source ../../exit.sh
;;
*)
    echo "wrong choice plz choose number from 1 to 8"
;;
esac
done