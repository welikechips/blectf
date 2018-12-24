#!/bin/bash
source ./mac
for i in {1..255};
do
    gatttool -b $MAC --char-write-req -a 0x003c -n `printf "%x" $i`
done
