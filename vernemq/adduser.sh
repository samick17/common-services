#!/usr/bin/env sh

username=samick
password=$(echo abcd1234 | bcrypt --cost=12)
redis-cli SET "[\"\",\"$username\",\"\"]" "{\"passhash\":\"$password\",\"subscribe_acl\":[{\"pattern\":\"a/+/c\"}]}"
redis-cli SET "[\"\",\"\",\"$username\"]" "{\"passhash\":\"$password\",\"subscribe_acl\":[{\"pattern\":\"a/+/c\"}]}"
redis-cli SET "[\"\",\"$username\",\"$username\"]" "{\"passhash\":\"$password\",\"subscribe_acl\":[{\"pattern\":\"a/+/c\"}]}"
