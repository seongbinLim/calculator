#!/bin/bash

# shutdown
~/apps/apache/bin/apachectl stop
~/apps/tomcat/bin/shutdown.sh

#build
cd ~/deploy/binary
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
tail -10000f ~/logs/tomcat/apache-tomcat-8.5.61/catalina.out

