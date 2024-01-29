#!/usr/bin/bash

echo "---------------------------------"
if [ -z "$(ls -A ~/dbproject/.db)" ]; then
    echo "there is no database yet"
else
    echo "--> existing database : "
   ls -F ~/dbproject/.db | grep / | tr '/' ' '
fi

echo "---------------------------------"
