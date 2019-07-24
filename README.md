This is the setup: https://github.com/welikechips/ble_ctf

hciconfig

make sure bluetooth is up for desired bluetooth dongle

hciconfig &lt;device&gt; up

## Flag 1:
```./write-flags.sh 12345678901234567890```   

## Flag 2: Read the output of 0x002e handle
```./write-flags.sh d205303e099ceff44835```

## Flag 3: Send the device md5 name to 0x002c
```./write-flags.sh $(echo -n "BLECTF" | md5sum)```

## Flag 4: Write anything to 0x0032
```
./write.sh 0x0032 "anything"
./read.sh 0x0032
3873c0270763568cf7aa
./write-flags.sh 3873c0270763568cf7aa
```

## Flag 5: Write the ascii value "yo" here to 0x0034
```
./write.sh 0x0034 "yo"
./read.sh 0x0034
c55c6314b3db0a6128af
./write-flags.sh c55c6314b3db0a6128af
```

## Flag 6: Write the hex value 0x07 here to 0x0036
```
./write.sh 0x0036 0x07
./read.sh 0x0036
1179080b29f8da16ad66
./write-flags.sh 1179080b29f8da16ad66
```

## Flag 7: Write 0xC9 to handle 58 (0x3A)
```
./write.sh 0x003a 0xC9
./read.sh 0x0038
f8b136d937fad6a2be9f
./write-flags.sh f8b136d937fad6a2be9f
```

## Flag 8: Brute Force my value 00 to ff
```brute force script.
933c1fcfa8ed52d2ec05
./write-flags.sh 933c1fcfa8ed52d2ec05
```

## Flag 9: Read my value 1000 times
```
#!/bin/bash
for((i=0;i<=1000;i++))
do
        ./read.sh 0x003e
done
./read.sh 0x003e
6ffcd214ffebdc0d069e
./write-flags.sh 6ffcd214ffebdc0d069e
```

## Flag 10: Listen to me for a single notification
```
./listen.sh 0x0040
gatttool -b <MAC Address> --char-write-req --handle=<handle> --value=0100 --listen
Characteristic value was written successfully
Notification handle = 0x0040 value: 35 65 63 33 37 37 32 62 63 64 30 30 63 66 30 36 64 38 65 62
decode that hex value
5ec3772bcd00cf06d8eb
./write-flags.sh 5ec3772bcd00cf06d8eb
```

## Flag 11: Listen to handle 0x0044 for a single indication
```
./indication.sh 0x0044
Characteristic value was written successfully
Indication   handle = 0x0044 value: 63 37 62 38 36 64 64 31 32 31 38 34 38 63 37 37 63 31 31 33
decode the hex value
c7b86dd121848c77c113
./write-flags.sh c7b86dd121848c77c113
```

## Flag 12: Listen to me for multi notifications 0x0046
```
./listen.sh 0x0046
Characteristic value was written successfully
Notification handle = 0x0046 value: 55 20 6e 6f 20 77 61 6e 74 20 74 68 69 73 20 6d 73 67 00 00 == U no want this msg..
Notification handle = 0x0046 value: 63 39 34 35 37 64 65 35 66 64 38 63 61 66 65 33 34 39 66 64
Notification handle = 0x0046 value: 63 39 34 35 37 64 65 35 66 64 38 63 61 66 65 33 34 39 66 64
Notification handle = 0x0046 value: 63 39 34 35 37 64 65 35 66 64 38 63 61 66 65 33 34 39 66 64
Notification handle = 0x0046 value: 63 39 34 35 37 64 65 35 66 64 38 63 61 66 65 33 34 39 66 64
Notification handle = 0x0046 value: 63 39 34 35 37 64 65 35 66 64 38 63 61 66 65 33 34 39 66 64
Notification handle = 0x0046 value: 63 39 34 35 37 64 65 35 66 64 38 63 61 66 65 33 34 39 66 64

c9457de5fd8cafe349fd
./write-flags.sh c9457de5fd8cafe349fd
```

## Flag 13: Listen to handle 0x004a for multi indications
```
./indication.sh 0x004a
Characteristic value was written successfully
Indication   handle = 0x004a value: 55 20 6e 6f 20 77 61 6e 74 20 74 68 69 73 20 6d 73 67 00 00 =U no want this msg.. 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
Indication   handle = 0x004a value: 62 36 66 33 61 34 37 66 32 30 37 64 33 38 65 31 36 66 66 61 
b6f3a47f207d38e16ffa
./write-flags.sh b6f3a47f207d38e16ffa
```

## Flag 14: Connect with BT MAC address 11:22:33:44:55:66
```
bdaddr -i hci1 11:22:33:44:55:66

root@kali:~/blectf# bdaddr -i hci1
Manufacturer:   Broadcom Corporation (15)
Device address: 5C:F3:70:81:D8:CD
root@kali:~/blectf# hciconfig hci1 down
root@kali:~/blectf# hciconfig hci1 up
root@kali:~/blectf# bdaddr -i hci1                                                                                                                                                                              
Manufacturer:   Broadcom Corporation (15)
Device address: 11:22:33:44:55:66
root@kali:~/blectf# gatttool -I -b $MAC 
[<Mac Address>][LE]> connect
./read.sh 0x004c
aca16920583e42bdcf5f
./write-flags.sh aca16920583e42bdcf5f
```

## Flag 15: Set your connection MTU to 444
```
gatttool -I -b $MAC
[cc:50:e3:80:c9:da][LE]> connect
Attempting to connect to cc:50:e3:80:c9:da
Connection successful
[cc:50:e3:80:c9:da][LE]> help
help                                           Show this help
exit                                           Exit interactive mode
quit                                           Exit interactive mode
connect         [address [address type]]       Connect to a remote device
disconnect                                     Disconnect from a remote device
primary         [UUID]                         Primary Service Discovery
included        [start hnd [end hnd]]          Find Included Services
characteristics [start hnd [end hnd [UUID]]]   Characteristics Discovery
char-desc       [start hnd] [end hnd]          Characteristics Descriptor Discovery
char-read-hnd   <handle>                       Characteristics Value/Descriptor Read by handle
char-read-uuid  <UUID> [start hnd] [end hnd]   Characteristics Value/Descriptor Read by UUID
char-write-req  <handle> <new value>           Characteristic Value Write (Write Request)
char-write-cmd  <handle> <new value>           Characteristic Value Write (No response)
sec-level       [low | medium | high]          Set security level. Default: low
mtu             <value>                        Exchange MTU for GATT/ATT
[cc:50:e3:80:c9:da][LE]> mtu 444
MTU was exchanged successfully: 444
[cc:50:e3:80:c9:da][LE]> exit
./read.sh 0x004e
b1e409e5a4eaf9fe5158
./write-flags.sh b1e409e5a4eaf9fe5158
```

## Flag 16: "Write+resp 'hello'  " 0x0050
```
./write.sh 0x0050 'hello'
./read.sh 0x0050
d41d8cd98f00b204e980
./write-flags.sh d41d8cd98f00b204e980
```

## Flag 17: No notifications here! really?'
```
 ./listen.sh 0x0052
Characteristic value was written successfully
Notification handle = 0x0052 value: 66 63 39 32 30 63 36 38 62 36 30 30 36 31 36 39 34 37 37 62
fc920c68b6006169477b
./write-flags.sh fc920c68b6006169477b
```

## Flag 18: So many properties!
```
./everything.sh 0x0054
Characteristic value was written successfully
Notification handle = 0x0054 value: 30 37 65 34 61 30 63 63 34 38
07e4a0cc48
./read.sh 0x0054 
fbb966958f
./write-flags.sh fbb966958f07e4a0cc48
```

## Flag 19: md5 of author's twitter handle
```./write-flags.sh $(echo -n "@hackgnar" | md5sum)```

