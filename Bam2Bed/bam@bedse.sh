#!/bin/sh
file=$1
exten=$2
samtools view -F 20 -F 4 $file | grep "XT:A:U" | awk -v ext=$exten '{if $2==0 print $3, $4, $4+ext, "+1"; else print $3, $4+length($10)-ext, $4+length($10), "-1"}'