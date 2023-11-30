#!/bin/bash

# T1053.006 - Scheduled Task/Job: Systemd Timers

# Atomic Test #1 - Create Systemd Service and Timer
echo "[Unit]" > /etc/systemd/system/art-timer.service
echo "Description=Atomic Red Team Systemd Timer Service" >> /etc/systemd/system/art-timer.service
echo "[Service]" >> /etc/systemd/system/art-timer.service
echo "Type=simple" >> /etc/systemd/system/art-timer.service
echo "ExecStart=/bin/touch /tmp/art-systemd-timer-marker" >> /etc/systemd/system/art-timer.service
echo "[Install]" >> /etc/systemd/system/art-timer.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/art-timer.service
echo "[Unit]" > /etc/systemd/system/art-timer.timer
echo "Description=Executes Atomic Red Team Systemd Timer Service" >> /etc/systemd/system/art-timer.timer
echo "Requires=art-timer.service" >> /etc/systemd/system/art-timer.timer
echo "[Timer]" >> /etc/systemd/system/art-timer.timer
echo "Unit=art-timer.service" >> /etc/systemd/system/art-timer.timer
echo "OnCalendar=*-*-* *:*:00" >> /etc/systemd/system/art-timer.timer
echo "[Install]" >> /etc/systemd/system/art-timer.timer
echo "WantedBy=timers.target" >> /etc/systemd/system/art-timer.timer
systemctl start art-timer.timer
systemctl enable art-timer.timer
systemctl daemon-reload
sleep 5
systemctl stop art-timer.timer
systemctl disable art-timer.timer
rm /etc/systemd/system/art-timer.service
rm /etc/systemd/system/art-timer.timer
systemctl daemon-reload
echo  $(date -u) "Completed T1053.006 - Create Systemd Service and Timer" >> /tmp/attacktest.txt
sleep 5

# Atomic Test #2 - Create a user level transient systemd service and timer
systemd-run --user --unit=Atomic-Red-Team --on-calendar '*:0/1' /bin/sh -c 'echo "$(date) $(whoami)" >>/tmp/log'
sleep 5
systemctl --user stop Atomic-Red-Team.service
systemctl --user stop Atomic-Red-Team.timer
rm /tmp/log
echo  $(date -u) "Completed T1053.006 - Create a user level transient systemd service and timer" >> /tmp/attacktest.txt
sleep 5

# Atomic Test #3 - Create a system level transient systemd service and timer
systemd-run --unit=Atomic-Red-Team --on-calendar '*:0/1' /bin/sh -c 'echo "$(date) $(whoami)" >>/tmp/log'
sleep 5
systemctl stop Atomic-Red-Team.service
systemctl stop Atomic-Red-Team.timer
rm /tmp/log
echo  $(date -u) "Completed T1053.006 - Create a user level transient systemd service and timer" >> /tmp/attacktest.txt
sleep 5

