#!/bin/bash

if [ ! -f versions.txt ]
then
        wget http://yoko.ukrtux.com:8899/versions.txt
fi
#mytemp=$( mktemp ) && cut -c 11- versions.txt >$mytemp $$ mv $mytemp version.txt
cut -c 11- versions.txt > versions1.txt
rm versions.txt
sort -n -t. -k 1,1 -k 2,2 -k 3,3 -k 4,4 versions1.txt > versions.txt
rm versions1.txt
sed 's/^/terraform-/' versions.txt

