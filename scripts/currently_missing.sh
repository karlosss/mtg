#!/bin/bash

/home/karlos/mtg/scripts/pc_to_human.sh <(comm -13 <(/home/karlos/mtg/scripts/human_to_pc.sh <(/home/karlos/mtg/scripts/present_cards.sh) /dev/stdout) <(/home/karlos/mtg/scripts/url_to_pc.sh "$1")) /dev/stdout
