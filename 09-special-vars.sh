#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables passed: $#"
echo "Script name: $0"
echo "Current working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "PID of the script excuting now: $$"
sleep 100 &
echo "PID of last backgrond command: $!"
echo "status of last command is: "$?""