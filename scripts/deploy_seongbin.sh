#!/bin/bash

#health check
sh health.sh
echo "finfinfin"

APP_PID=$(ps -ef | grep java | grep jogiyo-api.jar | grep -v grep | awk '{print $2}')
kill -15 $APP_PID
echo "Stop API Server"

# shutdown
apachectl stop
shutdown.sh

#build
cd ~/build/basecamp-jogiyo.web
git pull origin develop
./mvnw clean package

# prepare
cd target/
mv jogiyo-web*.war jogiyo-web.war

# deploy
rm ~/deploy/jogiyo-web.war
cp jogiyo-web.war ~/deploy/

# startup
nohup ~/apps/tomcat/bin/startup.sh &
~/apps/apache/bin/apachectl start

# log
tail -10000 ~/logs/tomcat/apache-tomcat-9.0.41/catalina.out >> ~/logs/jogiyo/web-server.log
tail ~/logs/jogiyo-web.log -n0 -F | while read line; do
            if [[ $line =~ 'JVM running for' ]]; then
                    pkill -9 -P $$ tail
            fi
    done;

echo "Jogiyo Server is up";

#api server
nohup java -jar -Dspring.profiles.active=prod ~/deploy/binary_api/target/jogiyo-api.jar 1>/dev/null 2>&1 &
echo "Run API Server"
