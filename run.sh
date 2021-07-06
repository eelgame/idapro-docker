#!/bin/bash
echo "Creating docker container from image and initializing... You may now connect with any of the scripts..."
docker run -it -d --name idapro -e DISPLAY=$DISPLAY -v $(pwd)/dropzone:/dropzone -p 31337:22 idapro # --rm
docker ps
