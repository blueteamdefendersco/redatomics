#! /bin/bash

function b() {
    mkdir -p ~/var/tmp

    #   Tactic: Defense Evasion
    #   Technique: T1222 - File Permission Modification
    chmod 1777 ~/var/tmp

    echo $(date -u) "Executed Atomic Red Team Rocke and Roll, Stage 02, part B" >> /tmp/atomic.log
}

b
