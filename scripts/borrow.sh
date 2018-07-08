#!/bin/bash

cp /home/karlos/mtg/pool/pool.txt /tmp/tmp3.txt

for f in /home/karlos/mtg/borrowed/*
do
    comm -23 /tmp/tmp3.txt "$f" > /tmp/tmp4.txt
    cp /tmp/tmp4.txt /tmp/tmp3.txt
done

comm -12 /tmp/tmp3.txt "$1" | sort > /tmp/borrow.txt
echo "Borrow list generated to /tmp/borrow.txt."
echo "---MISSING CARDS---"
comm -13 /tmp/tmp3.txt "$1" | sort | uniq -c | sed 's/^[ \t]*//g' | sed -E 's/^([0-9]+)[ \t]*/\1 /g'