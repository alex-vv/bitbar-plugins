#!/bin/bash

# Show disk free size
#
# metadata
# <bitbar.title>Disk free space</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Alexander Vykhodtsev</bitbar.author>
# <bitbar.author.github>alex-vv</bitbar.author.github>
# <bitbar.desc>Display disk free space</bitbar.desc>

output=$(df / | tail -1)
array=($output)
size=$(echo "scale=1; ${array[3]}/2/1024/1024" | bc ) 
echo "${size}G | size=9 font=Tahoma"