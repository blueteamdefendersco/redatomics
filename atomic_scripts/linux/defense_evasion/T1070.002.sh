#! /bin/bash

# T1070.002 - Indicator Removal on Host: Clear Linux or Mac System Logs

function a() {
    # Test 1 - rm -rf
    sudo cp -r /var/log/audit/ /var/log/audit_test/
    sudo rm -rf /var/log/audit_test
    echo  $(date -u) "Completed T1070.002 - rm -rf" >> /tmp/attacktest.txt 
    sleep 30
}

function b() {
    # Test 4 - Delete log files via cat utility by appending /dev/null or /dev/zero
    sudo cp /var/log/syslog /var/log/syslog_test
    sudo cat /dev/null > /var/log/syslog_test
    echo  $(date -u) "Completed T1070.002 - Delete log files via cat utility by appending /dev/null or /dev/zero" >> /tmp/attacktest.txt 
    sleep 30
}

function c() {
    # Test 5 - System log file deletion via find utility
    sudo cp /var/log/syslog /var/log/syslog_test
    sudo find /var/log -name syslog_test -exec rm {} \;
    echo  $(date -u) "Completed T1070.002 - System log file deletion via find utility" >> /tmp/attacktest.txt 
    sleep 30
}

function d() {
    # Test 6 - Overwrite system log via echo utility
    sudo cp /var/log/syslog /var/log/syslog_test
    sudo echo '' > /var/log/syslog_test
    echo  $(date -u) "Completed T1070.002 - Overwrite system log via echo utility" >> /tmp/attacktest.txt 
    sleep 30
}

function e() {
    # Test 15 - Overwrite Linux Log
    echo 0> #{log_path}
    echo  $(date -u) "Completed T1070.002 - Overwrite system log via echo utility" >> /tmp/attacktest.txt 
    sleep 30
}

a
b
c
d
e


