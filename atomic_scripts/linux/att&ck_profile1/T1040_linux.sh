#!/bin/bash

tcpdump -c 5 -nnni ens33
tshark -c 5 -i ens33

echo "Completed test T1040 for Linux
