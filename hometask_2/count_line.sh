#!/bin/bash

if [ ! -f versions.txt ]
then
	wget http://yoko.ukrtux.com:8899/versions.txt
fi

sort versions.txt | uniq -c | sort -nr >countresult.txt
sed -n 1p countresult.txt
rm countresult.txt

