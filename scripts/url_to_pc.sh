#!/bin/bash

url=$(echo "$1" | cut -d"#" -f1)

if grep 'mtggoldfish\.com' <<< "$url" &>/dev/null
then
    num=$(echo "$url" | cut -d"/" -f5)
    wget "https://www.mtggoldfish.com/deck/download/$num" -O /tmp/deck.txt &>/dev/null
    /home/karlos/mtg/scripts/human_to_pc.sh <(cat /tmp/deck.txt) /dev/stdout
elif grep 'mtgtop8\.com' <<< "$url" &>/dev/null
then
    wget "$url" -O /tmp/deck.txt &>/dev/null
    url=$(cat /tmp/deck.txt | grep 'Export <a href=' | sed -E 's|.*Export <a href=(.*)>MTGO</a>.*|\1|g')
    wget "http://www.mtgtop8.com/$url" -O /tmp/deck.txt &>/dev/null
    /home/karlos/mtg/scripts/human_to_pc.sh <(cat /tmp/deck.txt | tr -d '\r' | grep -v '^Sideboard$') /dev/stdout
else
    echo "Unsupported site!"
fi