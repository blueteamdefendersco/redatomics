#!/bin/bash

# T1053.003 - Scheduled Task/Job: Cron

# Atomic Test #1 - Cron - Replace crontab with referenced file
crontab -l > /tmp/notevil
echo "* * * * * /tmp/evil.sh" > /tmp/persistevil && crontab /tmp/persistevil
echo  $(date -u) "Completed T1053.003 - Cron - Replace crontab with referenced file" >> /tmp/attacktest.txt
sleep 5
crontab /tmp/notevil

# Atomic Test #2 - Cron - Add script to all cron subfolders
echo "echo 'Hello from Atomic Red Team'" > /tmp/atomic.log > /etc/cron.daily/persistevil
echo "echo 'Hello from Atomic Red Team'" > /tmp/atomic.log > /etc/cron.hourly/persistevil
echo "echo 'Hello from Atomic Red Team'" > /tmp/atomic.log > /etc/cron.monthly/persistevil
echo "echo 'Hello from Atomic Red Team'" > /tmp/atomic.log > /etc/cron.weekly/persistevil
echo  $(date -u) "Completed T1053.003 - Cron - Add script to all cron subfolders" >> /tmp/attacktest.txt
sleep 5
rm /etc/cron.daily/persistevil
rm /etc/cron.hourly/persistevil
rm /etc/cron.monthly/persistevil
rm /etc/cron.weekly/persistevil

# Atomic Test #3 - Cron - Add script to /etc/cron.d folder
echo "echo '*/5 * * * * root echo "Hello from Atomic Red Team"' > /tmp/atomic.log" > /etc/cron.d/persistevil
echo  $(date -u) "Completed T1053.003 - Cron - Add script to /etc/cron.d folder" >> /tmp/attacktest.txt
sleep 5
rm /etc/cron.d/persistevil

# Atomic Test #4 - Cron - Add script to /var/spool/cron/crontabs/ folder
echo "echo 'Hello from Atomic Red Team' > /tmp/atomic.log" >> /var/spool/cron/crontabs/persistevil
echo  $(date -u) "Completed T1053.003 - Cron - Add script to /var/spool/cron/crontabs/ folder" >> /tmp/attacktest.txt
sleep 5
rm /var/spool/cron/crontabs/persistevil

