#!/bin/bash

#sudo apt-get install aptitude

if [ ! -f /etc/cron.weekly/auto_update.sh ]
then
     sudo mv auto_update.sh /etc/cron.weekly
fi

var1=$(date +%Y%m%d)
sudo touch /var/log/update-$var1.log
sudo chmod ugo+rwx /var/log/update-$var1.log
var2=/var/log/update-$var1.log

echo "aptitude update" >> $var2
sudo aptitude update >>$var2 2>&1
echo "" >> $var2
echo "aptitude full-upgrade" >> $var2
sudo aptitude -y full-upgrade >> $var2 2>&1
echo "" >> $var2
echo "aptitude clean" >> $var2
sudo aptitude clean >> $var2 2>&1


