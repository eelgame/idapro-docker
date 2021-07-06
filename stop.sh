#!/bin/bash
echo "Stopping IDA Pro docker container..."
#docker stop $(docker ps -q --filter ancestor=idapro)
docker stop idapro # Since we give a --name to it in start
docker ps -a
