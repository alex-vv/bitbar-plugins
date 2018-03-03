#!/bin/bash

# Shows total task count in Things 3
#
# by Alexander Vykhodtsev (a.a.vykhodtsev@gmail.com)
#
# adjust font from Tahoma to your liking if Tahoma is not installed
#
# metadata
# <bitbar.title>Things total tasks</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Alexander Vykhodtsev</bitbar.author>
# <bitbar.author.github>alex-vv</bitbar.author.github>
# <bitbar.desc>Display total task count in Things 3</bitbar.desc>

function tellthings() {
	osascript -e "tell application \"Things3\" 
	$1
end tell"
}

if [ "$1" = 'launch' ]; then
  tellthings 'activate'
  exit
fi

case "$1" in
  'show quick entry panel' | 'log completed now' | 'empty trash')
    tellthings "$1"
    exit
esac

if [ "$1" = 'complete' ]; then
  tellthings "set toDo to to do named \"$2\" of list \"Today\"
	set status of toDo to completed
	delay 1.3"
  exit
fi

if [ "$(osascript -e 'application "Things3" is running')" = "false" ]; then
  echo "☑"
  echo "---"
  echo "Things 3 is not running"
  echo "Launch Things3 | bash='$0' param1=launch terminal=false"
  exit
fi

count=$(tellthings 'set list_size to count of (to dos whose status is open)
return list_size');

echo "☑ $count| size=9 font=Tahoma"
