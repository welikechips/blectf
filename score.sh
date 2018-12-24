#!/bin/bash
source ./mac
gatttool -b $MAC --char-read -a 0x002a | awk -F ':' '{print $2}' | tr -d ' ' | xxd -p -r; printf '\n';
