#!/bin/bash

echo $1 >test.txt
rev test.txt | cut -c 3- | rev >test1.txt
rm test.txt

a="$(awk '{print $1}' test1.txt)"
rm test1.txt

for i in {0..20};
do nc -vzn -w 1 $a.$i 80 2>&1 | grep succeeded;
   nc -vzn -w 1 $a.$i 443 2>&1 | grep succeeded;
	
done 
