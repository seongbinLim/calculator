#!/bin/bash
echo -e "[ 시각을 입력으로 넣으면 httpd, Tomcat 로그에서 그 시간 +-5분간의 데
이터를 출력해줍니다. ]"
echo -n "시각을 입력하세요 (YYYYMMDD HH:MM으로 입력) : "
read t

cur=$(date -d "$t" "+ %Y-%m-%d %H:%M")
echo "입력한 시각 : $cur"

DIR="/home1/irteam/logs/tomcat/apache-tomcat-8.5.61/catalina.out"

echo "target directory : $DIR"

for (( m=5; m>=0; m-- ))
do
    d=$(date -d "$cur $m min ago" "+ %Y-%m-%d %H:%M")
    cat $DIR | grep "$d"
done

for (( m=1; m<=5; m++ ))
do
    d=$(date -d "$cur $m min" "+ %Y-%m-%d %H:%M")
    cat $DIR | grep "$d"
done
