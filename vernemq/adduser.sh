#!/usr/bin/env bash

# [mountpoint, client_id, username]
# samick:abcd1234
# Usage: sh ./adduser.sh username clientId password
REDIS_NAMESPACE=whiteboard-testing
namespace=localwb:
username=$1
# clientId=$2
pw=$2

# password=$(htpasswd -bnBC 12 "" $pw | tr -d ':\n')
# password="\$2a""$(echo $password | cut -c 4-)"
password=$pw

redis-cli -a redis123 SET "$REDIS_NAMESPACE:mqtt:login:$username:$password" "{\"passhash\":\"$password\",\"subscribe_acl\":[{\"pattern\":\"#\"}],\"publish_acl\":[{\"pattern\":\"#\"}]}"

# redis-cli -a redis123 SET "[\"$mountpoint\",\"$clientId\",\"$username\"]" "{\"passhash\":\"$password\",\"subscribe_acl\":[{\"pattern\":\"#\"}],\"publish_acl\":[{\"pattern\":\"#\"}]}"
# redis-cli -a redis123 SET "[\"$mountpoint\",\"$username\"]" "{\"passhash\":\"$password\",\"subscribe_acl\":[{\"pattern\":\"#\"}],\"publish_acl\":[{\"pattern\":\"#\"}]}"
# redis-cli -a redis123 SET "abcd:1234" "zxczxczx"

# 
# `${redisKeys.mqttLoginPrefix}${username}:${pass}
