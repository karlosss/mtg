#!/bin/bash

cat "$1" | sort > /tmp/tmp.txt
mv /tmp/tmp.txt "$1"
