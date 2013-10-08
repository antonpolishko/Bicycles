#!/bin/sh
#sample $2 lines from file $1 randomly
file=$1
numLines=$2
awk 'BEGIN {srand()} {print rand() " " $0}' ${file} | sort | tail -n ${numLines} | sed 's/[^ ]* //' > ${file}_sample 