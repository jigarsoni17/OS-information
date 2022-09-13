#!/bin/bash

DATE=$(date +%d%m%y)

echo -e "Server host Name: `hostname`" > /tmp/osi-$DATE.txt
echo -e "Kernel version: `uname -r`" >> /tmp/osi-$DATE.txt
echo -e "total-Mounted-Usage : `df -h / | tail -1 | awk awk '{print $2, $3, $6}'`" >> /tmp/osi-$DATE.txt
echo -e "/swap partition Usage: `lsblk | grep '[SWAP]' | tail -1 | awk '{print $4}'`" >> /tmp/osi-$DATE.txt
echo -e "load average: `uptime | grep 'load average:'| tail -c 17 `" >> /tmp/osi-$DATE.txt
echo -e "Last boot: `who -b | tail -1 | awk '{print $3, $4}'`" >> /tmp/osi-$DATE.txt
echo -e "`cat /etc/os-release | head -6 | tail -1`" >> /tmp/osi-$DATE.txt
sudo sed -i 's/PRETTY/OS/' /tmp/osi-$DATE.txt
