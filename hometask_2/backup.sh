#!/bin/bash

var1=$1
var2=$2
backup_date=$(date +%Y%m%d)

mkdir $var2$backup_date
find "$var1" -type f -mtime -1 -exec cp {} "$var2$backup_date" \; 

echo "Files which had been changed during last 24 hours were sucsesfully copied from $var1 to $var2$backup_date"
