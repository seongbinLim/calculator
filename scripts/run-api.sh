#!/bin/bash

APP_PID=$(ps -ef | grep java | grep jogiyo-api.jar | grep -v grep | awk '{print $2}')

kill -15 $APP_PID

echo "Stop API Server"

nohup java -jar -Dspring.profiles.active=prod ~/deploy/binary_api/target/jogiyo-api.jar 1>/dev/null 2>&1 &

echo "Run API Server"
