#!/usr/bin/env sh

# Launch the first node
docker run -e "DOCKER_VERNEMQ_ACCEPT_EULA=yes" -e "DOCKER_VERNEMQ_ALLOW_ANONYMOUS=on" -p 8888:8888 -p 1883:1883 -p 8080:8080 --name vernemq1 -d vernemq/vernemq 
