#!/bin/bash
for((i=0;i<=1000;i++))
do
        ./read.sh 0x003e
	#counter=$i
        #i=$(printf "%#x\n" $i)
        #send $i $counter
done

