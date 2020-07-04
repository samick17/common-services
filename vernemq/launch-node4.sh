#!/usr/bin/env sh

# Launch the fourth node
docker run -e "DOCKER_VERNEMQ_DISCOVERY_NODE=172.17.0.2" -e "DOCKER_VERNEMQ_ACCEPT_EULA=yes" -e "DOCKER_VERNEMQ_ALLOW_ANONYMOUS=on" -p 31883:1883 --name vernemq4 -d vernemq/vernemq
