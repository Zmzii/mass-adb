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

# ADB All[Send adb command to all connected devices]

if [ -z $2 ]
then
  exit 1
fi

DEVICES=`adb devices | tail -n +2 | cut -f1`
for DEVICE in $DEVICES
do
  RUN="adb -s $DEVICE shell $2 &"
  echo $RUN
  ${RUN}
done
