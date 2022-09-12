#!/bin/bash

echo -e "Server host Name: `hostname`" > /tmp/os_information.txt
echo -e "Kernel version: `uname -r`" >> /tmp/os_information.txt
echo -e "Mounted & Usage : `df -h / | tail -1 | awk '{print $6, $3}'`" >> /tmp/os_information.txt
echo -e "/swap partition size: `lsblk | grep '[SWAP]' | tail -1 | awk '{print $4}'`" >> /tmp/os_information.txt
#echo -e "/home partition size"
echo -e "load average: `uptime | grep 'load average:'| tail -c 17 `" >> /tmp/os_information.txt
#echo -e "Lowest load avg: `uptime | grep 'load average:'| tail -c 17 | awk '{print $2}'| cut -f1 -d,`" >> text.txt
echo -e "Last boot: `who -b | tail -1 | awk '{print $3, $4}'`" >> /tmp/os_information.txt
echo -e "`cat /etc/os-release | head -6 | tail -1`" >> /tmp/os_information.txt
sudo sed -i 's/PRETTY/OS/' /tmp/os_information.txt
