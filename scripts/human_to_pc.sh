#!/bin/bash

cat "$1" | tr -d '\r' | awk '

{
    for(i = 0; i < $1; i++){
        for(j = 2; j <= NF; j++){
            printf $j " "
        }
        printf "\n"
    }
}

' | sort > "$2"
