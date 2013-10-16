#!/bin/sh
samtools view -f 67 -F 1804 $1 | grep "XT:A:U"|  awk '{if ($9>0) print $3, $4, $4+$9, $5; else print $3, $8, $8-$9, $5}'
