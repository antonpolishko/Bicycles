#!/bin/sh
file=$1
exten=$2
#do extension for prime ends
samtools view -f 67 -F 1804 ${file} | grep "XT:A:U"|  awk -v ext=$exten '{if ($9>0) print $3, $4, $4+ext, $5; else print $3, $8, $8+ext, $5}'
#do extension for secondary ends
samtools view -f 67 -F 1804 ${file} | grep "XT:A:U"|  awk -v ext=$exten '{if ($9>0) print $3, $4+$9-ext, $4+$9, $5; else print $3, $8, $8+ext, $5}'
