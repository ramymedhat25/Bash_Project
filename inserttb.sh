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
   read -p "enter table name you want to insert in : " name
    if [[ -f ~/dbproject/.db/$1/$name ]];then
		fieldsnum=$(awk -F, 'NR==1 {print NF-1}' "$name")
		datatypes=$(awk 'NR==2' "$name")
		IFS=',' read -ra dtarray <<< "$datatypes"
		metanames=$(awk 'NR==1' "$name")
		IFS=',' read -ra mnarray <<< "$metanames"
		priarr=()
		mapfile -t priarr < <(awk -F, '{print $1}' "$name")
		row=""
		rowpri=""
		for ((i=1;i<=$fieldsnum;i++))
		do
		while true
		do 
		
		read -p "column [${mnarray[$i-1]} ] which has type [${dtarray[$i-1]}] data is: " data
		if [[ $i == 1 ]]; then
		case $data in
		'')
			echo "primary key can not be empty"
			continue
		;;
		esac
		fi
		if [[ $i == 1 ]]; then
    	if [[ " ${priarr[@]} " =~ " $data " ]]; then
        echo "column name $data already exist"
        continue
    	fi
		fi
		if [[ ${dtarray[$i-1]} == "string" ]]; then
			row+="$data,"
			if [[ $i == 1 ]]; then
				rowpri+="$data,"
			fi
			break
		elif [[ ${dtarray[$i-1]} == "integer" ]]; then
		if [[ $data =~ ^[0-9]+$  ]]; then
			row+="$data,"
			if [[ $i == 1 ]]; then
				rowpri+="$data,"
			fi
			break
		else 
			echo " you should enter number"
			continue
		fi
		fi
		done
		done
		 



		echo $row >> $name
		echo $rowpri >> $primaryname

		echo "table row made successfully"
		cat $name
		source ../../tables.sh
    else
        echo "sorry table [$name] doesn't exist"
    fi 
fi
