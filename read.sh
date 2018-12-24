#!/bin/bash
source ./mac
gatttool -b $MAC --char-read -a $1 | awk -F ':' '{print $2}' | tr -d ' ' | xxd -p -r; printf '\n';
