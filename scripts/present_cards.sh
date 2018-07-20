#!/bin/bash

/home/karlos/mtg/scripts/pc_to_human.sh <(comm -13 <(/home/karlos/mtg/scripts/human_to_pc.sh <(cat /home/karlos/mtg/borrowed/*) /dev/stdout) <(/home/karlos/mtg/scripts/human_to_pc.sh /home/karlos/mtg/pool/pool.txt /dev/stdout)) /dev/stdout
