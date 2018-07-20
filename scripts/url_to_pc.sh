#!/bin/bash

url=$(echo "$1" | cut -d"#" -f1)

if grep 'mtggoldfish\.com' <<< "$url" &>/dev/null
then
    num=$(echo "$url" | cut -d"/" -f5)
    wget "https://www.mtggoldfish.com/deck/download/$num" -O /tmp/deck.txt &>/dev/null
    /home/karlos/mtg/scripts/human_to_pc.sh <(cat /tmp/deck.txt) /dev/stdout
else
    echo "Unsupported site!"
fi