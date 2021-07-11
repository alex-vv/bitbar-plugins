#!/bin/bash

# Show disk free size and swap size
#
# metadata
# <bitbar.title>Disk free space and swap size</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Alexander Vykhodtsev</bitbar.author>
# <bitbar.author.github>alex-vv</bitbar.author.github>
# <bitbar.desc>Display disk free space and swap size</bitbar.desc>

output=$(sysctl vm.swapusage)
array=($output)
vm=${array[6]%M}
size=$(echo "scale=1; x=$vm/1024; if (x<1) print 0; x" | bc)

output=$(df / | tail -1)
array=($output)
df=$(echo "scale=1; ${array[3]}/2/1024/1024" | bc ) 
echo "${df}G\n${size}G | size=7"

