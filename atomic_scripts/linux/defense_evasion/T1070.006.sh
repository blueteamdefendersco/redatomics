#!/bin/bash

# T1070.006 - Indicator Removal on Host: Timestomp

# Atomic Test #1 - Set a file's access timestamp
sleep 2
echo 'T1070.006 file access timestomp test' > /tmp/T1070.006-access.txt
sleep 2
touch -a -t 197001010000.00 /tmp/T1070.006-access.txt
sleep 5
rm -f /tmp/T1070.006-access.txt
sleep 5
echo  $(date -u) "Completed T1070.006 - Set a file's access timestamp" >> /tmp/attacktest.txt

# Atomic Test #2 - Set a file's modification timestamp
sleep 2
echo 'T1070.006 file modification timestomp test' > /tmp/T1070.006-modification.txt
sleep 2
touch -m -t 197001010000.00 /tmp/T1070.006-modification.txt
sleep 5
rm -f /tmp/T1070.006-modification.txt
sleep 5
echo  $(date -u) "Completed T1070.006 - Set a file's modification timestamp" >> /tmp/attacktest.txt

# Atomic Test #3 - Set a file's creation timestamp
NOW=$(date +%m%d%H%M%Y)
date 010100001971
touch /tmp/T1070.006-creation.txt
date "$NOW"
stat /tmp/T1070.006-creation.txt
sleep 5
rm -f /tmp/T1070.006-creation.txt
sleep 5
echo  $(date -u) "Completed T1070.006 - Set a file's creation timestamp" >> /tmp/attacktest.txt

# Atomic Test #4 - Modify file timestamps using reference file
sleep 2
echo 'T1070.006 reference file timestomp test' > /tmp/T1070.006-reference.txt
touch -acmr /bin/sh /tmp/T1070.006-reference.txt
sleep 2
rm -f /tmp/T1070.006-reference.txt
sleep 5
echo  $(date -u) "Completed T1070.006 - Modify file timestamps using reference file" >> /tmp/attacktest.txt
