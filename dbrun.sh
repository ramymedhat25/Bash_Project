#!/usr/bin/bash
PS3=">>"
if [ ! -d ~/dbproject/.db ];then
    mkdir ~/dbproject/.db
fi 

select var in "create db" "list db" "connect db" "drop db"
do
case $REPLY in 
1)
   source ./createdb.sh
;;
2)
   source ./listdb.sh 
;;
3)
    source ./connectdb.sh
;;
4)
   source ./dropdb.sh
;;
*)
    echo "wrong choice plz choose number from 1 to 4"
;;
esac
done