#! /bin/bash

#   Tactic: Defense Evasion
#   Technique: T1222 - File Permission Modification

function a() {
    mkdir -p /tmp/T1222/recurse
    touch /tmp/T1222/file1
    touch /tmp/T1222/file2
    touch /tmp/T1222/file3
    touch /tmp/T1222/recurse/file4
    touch /tmp/T1222/file5
    sleep 60

}

function b() {
    chmod 1777 /tmp/T1222/file1
    chmod a+w /tmp/T1222/file2
    chown root:root /tmp/T1222/file3
    chown -R root:root /tmp/T1222/recurse
    chattr -i /tmp/T1222/file5
    echo $(date -u) "Executed T1222 checks" >> /tmp/atomic2.log
    sleep 60
}

function c() {
    rm /tmp/T1222/file1
    rm /tmp/T1222/file2
    rm /tmp/T1222/file3
    rm /tmp/T1222/recurse/file4
    rm /tmp/T1222/file5
    echo $(date -u) "Cleaned up T1222 checks" >> /tmp/atomic2.log

}

a
b
c

