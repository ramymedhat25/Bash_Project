#!/usr/bin/bash

echo "Enter table name to update:"
read tableName

if [[ ! -f $tableName ]]; then
    echo "Table $tableName does not exist."
    exit 1
fi

echo "Enter the primary key of the record to update:"
read primaryKey

echo "Enter the column number to update:"
read columnNumber

echo "Enter the new value:"
read newValue

lineNumber=$(grep -n "^$primaryKey" $tableName | cut -d: -f1)

if [[ ! $lineNumber ]]; then
    echo "Record not found."
    exit 1
fi

# Update the record
awk -F, -v lineNum=$lineNumber -v colNum=$columnNumber -v newVal="$newValue" 'BEGIN {OFS=","} NR == lineNum {$colNum = newVal; print} NR != lineNum {print}' $tableName > temp && mv temp $tableName

echo "Record updated successfully."