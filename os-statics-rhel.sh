#!/bin/bash

DATE=$(date +%d%m%y)

echo -e "Server host Name: `hostname`" > /tmp/osi-$DATE.txt
echo -e "Kernel version: `uname -r`" >> /tmp/osi-$DATE.txt
echo -e "Mounted & Usage: `df -h / | tail -1 | awk '{print $6, $3}'`" >> /tmp/osi-$DATE.txt
echo -e "/swap partition Usage: `lsblk | grep '[SWAP]' | tail -1 | awk '{print $4}'`" >> /tmp/osi-$DATE.txt
#echo -e "/home partition size"
echo -e "load average: `uptime | grep 'load average:'| tail -c 17 `" >> /tmp/osi-$DATE.txt
#echo -e "Lowest load avg: `uptime | grep 'load average:'| tail -c 17 | awk '{print $2}'| cut -f1 -d,`" >> text.txt
echo -e "Last boot: `who -b | tail -1 | awk '{print $3, $4}'`" >> /tmp/osi-$DATE.txt
echo -e "`cat /etc/os-release | head -6 | tail -1`" >> /tmp/osi-$DATE.txt
sudo sed -i 's/PRETTY/OS/' /tmp/osi-$DATE.txt
