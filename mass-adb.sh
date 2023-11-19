#!/bin/bash

# Connect to all devices from ip list
if [ $# -eq 0 ]
then
  echo "Usage: ./mass-adb.sh ips.txt \"shell command\""
  exit 1
fi

adb devices

while read -r ip
do
  RUN="adb connect $ip:5555 &"
  echo $RUN
  ${RUN}
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
