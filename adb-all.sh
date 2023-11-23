#!/bin/bash

# Connect to all devices from ip list
if [ $# -eq 0 ]
then
  echo "Usage: ./adb-all.sh \"Adb Command(s)\""
  exit 1
fi

DEVICES=`adb devices | tail -n +2 | cut -f1`
for DEVICE in $DEVICES
do
  RUN="adb -s $DEVICE $@ &"
  echo ">> $RUN"
  ${RUN}
done
