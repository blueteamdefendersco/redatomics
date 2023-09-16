#!/bin/bash

sh -c "echo 'echo Created and executed a simple bash script' > /tmp/art.sh
sh -c "echo 'ping -c 4 8.8.8.8' >> /tmp/art.sh
chmod +x /tmp/art.sh
sh /tmp/art.sh

sleep 30

rm /tmp/art.sh

