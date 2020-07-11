#!/usr/bin/env sh

# -e "DOCKER_VERNEMQ_ALLOW_ANONYMOUS=off" \
# -e "DOCKER_VERNEMQ_PLUGINS__VMQ_DIVERSITY=on" \
# -e "DOCKER_VERNEMQ_PLUGINS__VMQ_PASSWD=off" \
# -e "DOCKER_VERNEMQ_PLUGINS__VMQ_ACL=off" \
# -e "DOCKER_VERNEMQ_VMQ_DIVERSITY__REDIS__host=redis" \
# -e "DOCKER_VERNEMQ_VMQ_DIVERSITY__REDIS__port=6379" \
# -e "DOCKER_VERNEMQ_VMQ_DIVERSITY__REDIS__password=" \
# -e "DOCKER_VERNEMQ_VMQ_DIVERSITY__HTTP_AUTH__file=/auth_http.lua" \
# -v $(pwd)/auth_http.lua:/auth_http.lua \
docker run \
	-e "DOCKER_VERNEMQ_ACCEPT_EULA=yes" \
	-e "DOCKER_VERNEMQ_ALLOW_ANONYMOUS=off" \
	-e "DOCKER_VERNEMQ_PLUGINS__VMQ_DIVERSITY=on" \
	-e "DOCKER_VERNEMQ_PLUGINS__VMQ_PASSWD=off" \
	-e "DOCKER_VERNEMQ_PLUGINS__VMQ_ACL=off" \
	-e "DOCKER_VERNEMQ_VMQ_DIVERSITY__AUTH_REDIS__ENABLED=on" \
	-e "DOCKER_VERNEMQ_VMQ_DIVERSITY__REDIS__HOST=redis" \
	-e "DOCKER_VERNEMQ_VMQ_DIVERSITY__REDIS__PORT=6379" \
	--add-host="redis:10.0.2.15" \
	--name vernemq1 \
	-p 1883:1883 \
	-p 8080:8080 \
	-p 8888:8888 \
	-d vernemq/vernemq

# docker run \
# 	-e "DOCKER_VERNEMQ_ACCEPT_EULA=yes" \
#   -e "DOCKER_VERNEMQ_ALLOW_ANONYMOUS=off" \
# 	--add-host="redis:10.0.2.15" \
# 	--name vernemq1 \
# 	-p 1883:1883 \
# 	-p 8080:8080 \
# 	-p 8888:8888 \
# 	-d vernemq/vernemq
