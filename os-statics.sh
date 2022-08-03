#!/bin/bash

echo -e "Server host Name: `hostname`" > text.txt
echo -e "Kernel version: `uname -r`" >> text.txt
echo -e "Mounted & Usage : `df -h / | tail -1 | awk '{print $6, $3}'`" >> text.txt
echo -e "/swap partition size: `lsblk | grep '[SWAP]' | tail -1 | awk '{print $4}'`" >> text.txt
#echo -e "/home partition size"
echo -e "load average: `uptime | grep 'load average:'| tail -c 17 `" >> text.txt
#echo -e "Lowest load avg: `uptime | grep 'load average:'| tail -c 17 | awk '{print $2}'| cut -f1 -d,`" >> text.txt
echo -e "Last boot: `who -b | tail -1 | awk '{print $3, $4}'`" >> text.txt
echo -e "OS `cat /etc/os-release | head -1`" >> text.txt



