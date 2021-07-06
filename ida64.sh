#!/bin/bash
ssh -p 31337 -o StrictHostKeyChecking=no -o "UserKnownHostsFile /dev/null" -o ForwardX11=yes -o ForwardX11Trusted=yes -X root@localhost wine "IDA/ida64.exe"
