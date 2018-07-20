#!/bin/bash

cat "$1" | awk '

{
    arr[$0]++
}

END {
    for(val in arr){
        printf arr[val] " " val "\n"
    }
}

' | sort -k2,2 > "$2"
