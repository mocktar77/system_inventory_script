#!/bin/bash

## Description: System inventory
## Author: Mocktar TAIROU/mocktar.tairou@gmail.com

#!/bin/bash

## Check the OS version

os=$(cat /etc/*release | head -1) > /dev/null 2>&1
echo " The OS is ${os} "

sleep 3
echo " "
echo " "
# Check the size of the memory

mem=$(free -m |grep Mem | awk '{print$2}') > /dev/null 2>&1
echo " The total memory size is ${mem}"

sleep 3
echo " "
echo " "
## The size of the hard drive
hd=$(lsblk | grep disk| awk '{print$4}') > /dev/null 2>&1
echo " The hard drive size is ${hd}"
sleep 3
echo " "
echo " "
## The cpu speed
sp=$(lscpu | grep "CPU MHz" | awk '{print$3}') > /dev/null 2>&1
echo " The cpu speed is ${sp} MHz"

sleep 3
echo " "
echo " "
## The kernel version
kn=$(uname -r | awk -F- '{print$1}') > /dev/null 2>&1
echo " The kernel version is ${kn}"

sleep 3
echo " "
echo " "
## Check if system bits

echo " The system has $(arch | awk -F_ '{print$2}') bits"

sleep 3
echo " "
echo " "

## The Hostname
echo " The hostname is $HOSTNAME " 

sleep 3
echo " "
echo " "
## The ip address
ip=$(ip address show dev enp0s3 | grep inet | head -1 | awk '{print$2}') > /dev/null 2>&1
echo " The ip address is ${ip} "

sleep 3
echo " "
echo " "
## All opened ports
echo " Here are all the opened port"
echo " " 
ss -tulpn | grep LISTEN

sleep 3
echo " "
echo " "
## The DNS
echo "The DNS address is $(cat /etc/resolv.conf | grep nameserver)"

sleep 3
echo " "
echo " "
## Check the manufacturer
echo " The manufacturer is $(dmidecode -t system | grep Manufacturer | awk '{print$2}')"

sleep 3
echo " "
echo " "
## Virtual or physical system
echo " This is a  $(dmidecode -t system | grep Family | awk '{print$2,$3}') "

sleep 3 
echo " "
echo " "
## The mac address
echo " The system mac address is $(ip address show dev enp0s3 |grep ether | awk '{print$2}')"
echo " "
echo " "
sleep 3
exit 0
echo " "
echo " "
