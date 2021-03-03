#/bin/bash

DATA=$(lsusb |grep -i stm)
echo $DATA
BUS=$(echo $DATA | awk '{print $2}')
echo $BUS
DEV=$(echo $DATA | awk '{print $4}')
DEV=${DEV%?}
echo $DEV

ls -la /dev/bus/usb/$BUS/$DEV
