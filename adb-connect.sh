#!/bin/bash

# Connect to all devices from ip list
if [ $# -eq 0 ]
then
  echo "Usage: ./adb-connect.sh ips.txt"
  exit 1
fi

adb devices

while read -r ip
do
  adb connect $ip:5555 &
done < $1
