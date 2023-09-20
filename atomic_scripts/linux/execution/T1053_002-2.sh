#! /bin/bash

# This test submits a command to be run in the future by the at daemon

bash -c echo "================ Atomic Test - At - Schedule a Job ==============="

bash -c echo "echo Hello from Atomic Red Team" > /tmp/testing_T1053_002-2.txt | at now + 1 minute

sleep 180

rm /tmp/testing_T1053_002-2.txt
