#! /bin/bash

#  T1222.002 - File and Directory Permissions Modification: Linux and Mac File and Directory Permissions Modification

function a() {
    # Test 1 - chmod - Change file or folder mode (numeric mode)
    mkdir -p /tmp/T1222/recurse
    touch /tmp/T1222/file1
    chmod 755 /tmp/T1222/file1
    echo  $(date -u) "Completed T1222.002 - chmod - Change file or folder mode (numeric mode)" >> /tmp/attacktest.txt
    sleep 30
}

function b() {
    # Test 2 - chmod - Change file or folder mode (symbolic mode)
    touch /tmp/T1222/file2
    chmod a+w /tmp/T1222/file2
    echo  $(date -u) "Completed T1222.002 - chmod - Change file or folder mode (symbolic mode)" >> /tmp/attacktest.txt
    sleep 30
}

function c() {
    # Test 3 - chmod - Change file or folder mode (numeric mode) recursively
    touch /tmp/T1222/recurse/file3
    chmod -R 755 /tmp/T1222/recurse
    echo  $(date -u) "Completed T1222.002 - chmod - Change file or folder mode (numeric mode) recursively" >> /tmp/attacktest.txt
    sleep 30
}

function d() {
    # Test 4 - chmod - Change file or folder mode (symbolic mode) recursively
    mkdir /tmp/T1222/recurse2
    touch /tmp/T1222/recurse2/file4
    chmod -R a+w /tmp/T1222/recurse2
    echo  $(date -u) "Completed T1222.002 - chmod - Change file or folder mode (symbolic mode) recursively" >> /tmp/attacktest.txt
    sleep 30
}

function e() {
    # Test 5 - chown - Change file or folder ownership and group
    touch /tmp/T1222/file5
    sudo chown root:root /tmp/T1222/file5
    echo  $(date -u) "Completed T1222.002 - chown - Change file or folder ownership and group" >> /tmp/attacktest.txt
    sleep 30
}

function f() {
    # Test 6 - chown - Change file or folder ownership and group recursively
    mkdir /tmp/T1222/recurse3
    touch /tmp/T1222/recurse3/file6
    sudo chown -R root:root /tmp/T1222/recurse3
    echo  $(date -u) "Completed T1222.002 - chown - Change file or folder ownership and group recursively" >> /tmp/attacktest.txt
    sleep 30
}

function g() {
    # Test 7 - chown - Change file or folder mode ownership only
    touch /tmp/T1222/file7
    sudo chown root /tmp/T1222/file7
    echo  $(date -u) "Completed T1222.002 - chown - Change file or folder mode ownership only" >> /tmp/attacktest.txt
    sleep 30
}

function h() {
    # Test 8 - chown - Change file or folder ownership recursively
    mkdir /tmp/T1222/recurse4
    touch /tmp/T1222/recurse4/file8
    sudo chown -R root /tmp/T1222/recurse4
    echo  $(date -u) "Completed T1222.002 - chown - Change file or folder ownership recursively" >> /tmp/attacktest.txt
    sleep 30
}

function i() {
    # Test 9 - chattr - Remove immutable file attribute
    touch /tmp/T1222/file9
    chattr -i /tmp/T1222/file9
    echo  $(date -u) "Completed T1222.002 - chattr - Remove immutable file attribute" >> /tmp/attacktest.txt
    sleep 30
}

function z() {
    # Clean up
    sudo rm -rf /tmp/T1222
    echo  $(date -u) "Cleaned up T1222.002" >> /tmp/attacktest.txt
    sleep 30
}

a
b
c
d
e
f
g
h
i
z

