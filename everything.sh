#!/bin/bash
source ./mac
gatttool -b $MAC --char-write-req --handle=$1 --value=0300 --listen
