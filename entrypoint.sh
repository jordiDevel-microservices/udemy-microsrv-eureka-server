#!/usr/bin/env bash

./wait-for-it.sh -t 0 config-server:8888 -- echo "config-server is up"

java -jar -Dspring.profiles.active=docker eureka-server.jar
