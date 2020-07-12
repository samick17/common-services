#!/usr/bin/env bash

# [mountpoint, client_id, username]
# samick:abcd1234
# Usage: sh ./adduser.sh username clientId password
username=$1
clientId=$2

password=$(htpasswd -bnBC 12 "" $3 | tr -d ':\n')
password="\$2a""$(echo $password | cut -c 4-)"

redis-cli -a redis123 SET "[\"$mountpoint\",\"$clientId\",\"$username\"]" "{\"passhash\":\"$password\",\"subscribe_acl\":[{\"pattern\":\"#\"}],\"publish_acl\":[{\"pattern\":\"#\"}]}"
