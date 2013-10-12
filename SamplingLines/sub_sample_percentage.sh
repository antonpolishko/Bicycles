#!/bin/sh
#sample $2 lines from file $1 randomly
file=$1
perLines=$2
awk -v per=${perLines} 'BEGIN {srand()} !/^$/ { if (rand() <= per/100.0) print $0}' ${file} #> ${file}_sample 