#!/bin/bash

/home/karlos/mtg/scripts/url_to_pc.sh "$1" > /tmp/x
comm -23 /tmp/x <(/home/karlos/mtg/scripts/human_to_pc.sh <(/home/karlos/mtg/scripts/currently_missing.sh "$1") /dev/stdout) > /tmp/y
echo "BORROW LIST:"
echo "------------"
/home/karlos/mtg/scripts/pc_to_human.sh /tmp/y /dev/stdout
echo "------------"
echo -n "Enter file name: "
read f
if [ -f "/home/karlos/mtg/borrowed/$f" ]
then
    /home/karlos/mtg/scripts/human_to_pc.sh "/home/karlos/mtg/borrowed/$f" /tmp/x
else
    > /tmp/x
fi
/home/karlos/mtg/scripts/pc_to_human.sh <(cat /tmp/x /tmp/y) /tmp/z
mv /tmp/z "/home/karlos/mtg/borrowed/$f"
rm /tmp/x /tmp/y
echo "Cards borrowed."
