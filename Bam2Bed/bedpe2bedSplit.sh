#!/bin/sh
file=$1
exten=$2
#do extension for prime ends
awk -v ext=$exten '{print $1, $2, $2+ext, $4 "\n", $1, $3-ext, $3, $4}' $file | awk '{print $1, $2, $3, $4}'

