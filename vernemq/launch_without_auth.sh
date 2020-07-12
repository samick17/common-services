#!/usr/bin/env sh

# Launch without auth
docker run \
	-e "DOCKER_VERNEMQ_ACCEPT_EULA=yes" \
	-e "DOCKER_VERNEMQ_ALLOW_ANONYMOUS=on" \
	--name vernemq1 \
	-p 1883:1883 \
	-p 8080:8080 \
	-p 8888:8888 \
	-d vernemq/vernemq
