#!/bin/bash

> /tmp/tmp2.txt
IFS=$(echo -e '\xa')
re='^[0-9]+$'
f=$(cat "$1" | tr -d '\r')

while read -r i
do
    cnt=$(echo "$i" | cut -d" " -f1)
    card=$(echo "$i" | cut -d" " -f2-)

    if ! [[ $cnt =~ $re ]]
    then
        continue
    fi

    for (( j=0; j<$cnt; j++ ))
    do
        echo "$card" >> /tmp/tmp2.txt
    done
done <<< "$f"

/home/karlos/mtg/scripts/sort.sh /tmp/tmp2.txt
mv /tmp/tmp2.txt "$1"