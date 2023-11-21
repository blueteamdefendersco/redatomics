#!/bin/bash

# T1070.003 - Indicator Removal on Host: Clear Command History

# Atomic Test #1 - Clear Bash history (rm)
cp ~/.bash_history ~/.bash_history.orig
sleep 5
rm ~/.bash_history
sleep 5
mv ~/.bash_history.orig ~/.bash_history
sleep 5
echo  $(date -u) "Completed T1070.003 - Clear Bash history (rm)" >> /tmp/attacktest.txt

# Atomic Test #2 - Clear Bash history (echo)
cp ~/.bash_history ~/.bash_history.orig2
sleep 5
echo "" > ~/.bash_history
sleep 5
mv ~/.bash_history.orig2 ~/.bash_history
sleep 5
echo  $(date -u) "Completed T1070.003 - Clear Bash history (echo)" >> /tmp/attacktest.txt

# Atomic Test #3 - Clear Bash history (cat dev/null)
cp ~/.bash_history ~/.bash_history.orig3
sleep 5
cat /dev/null > ~/.bash_history
sleep 5
mv ~/.bash_history.orig3 ~/.bash_history
sleep 5
echo  $(date -u) "Completed T1070.003 - Clear Bash history (cat /dev/null)" >> /tmp/attacktest.txt

# Atomic Test #4 - Clear Bash history (ln dev/null)
cp ~/.bash_history ~/.bash_history.orig4
sleep 5
ln -sf /dev/null > ~/.bash_history
sleep 5
mv ~/.bash_history.orig4 ~/.bash_history
sleep 5
echo  $(date -u) "Completed T1070.003 - Clear Bash history (ln /dev/null)" >> /tmp/attacktest.txt

# Atomic Test #5 - Clear Bash history (truncate)
cp ~/.bash_history ~/.bash_history.orig5
sleep 5
truncate -s0 /dev/null > ~/.bash_history
sleep 5
mv ~/.bash_history.orig5 ~/.bash_history
sleep 5
echo  $(date -u) "Completed T1070.003 - Clear Bash history (truncate)" >> /tmp/attacktest.txt

# Atomic Test #6 - Clear history of a bunch of shells
cp ~/.bash_history ~/.bash_history.orig6
ls -la
sleep 5
unset HISTFILE
export HISTFILESIZE=0
history -c
ls -la
sleep 5
mv ~/.bash_history.orig6 ~/.bash_history
sleep 5
echo  $(date -u) "Completed T1070.003 - Clear Bash history of a bunch of shells" >> /tmp/attacktest.txt

# Atomic Test #7 - Clear and Disable Bash History Logging
cp ~/.bash_history ~/.bash_history.orig7
ls -la
sleep 5
set +o history
echo 'set +o history' >> ~/.bashrc
. ~/.bashrc
history -c
sleep 15
sed -i 's/set +o history//g' ~/.bashrc
. ~/.bashrc
set -o history
ls -la
mv ~/.bash_history.orig7 ~/.bash_history
sleep 5
echo  $(date -u) "Completed T1070.003 - Clear and disable bash history logging" >> /tmp/attacktest.txt

# Atomic Test #8 - Use Space Before Command to Avoid Logging to History
 hostname
 whoami
sleep 5
echo  $(date -u) "Completed T1070.003 - Use space before command to avoid logging histroy" >> /tmp/attacktest.txt
sleep 5

echo "Finished"
