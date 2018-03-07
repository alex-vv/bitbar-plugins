#!/bin/bash

# Show swap size
#
# metadata
# <bitbar.title>Swap size</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Alexander Vykhodtsev</bitbar.author>
# <bitbar.author.github>alex-vv</bitbar.author.github>
# <bitbar.desc>Display swap size</bitbar.desc>

output=$(sysctl vm.swapusage)
echo "${array[6]}"