#!/bin/bash

echo -e "\n\n[ 최근 10분간 많이 접속한 IP 통계 출력 ]"

d1=$(date --date="-10 min" "+ %H:%M:")
d2=$(date --date="-9 min" "+ %H:%M:")
d3=$(date --date="-8 min" "+ %H:%M:")
d4=$(date --date="-7 min" "+ %H:%M:")
d5=$(date --date="-6 min" "+ %H:%M:")
d6=$(date --date="-5 min" "+ %H:%M:")
d7=$(date --date="-4 min" "+ %H:%M:")
d8=$(date --date="-3 min" "+ %H:%M:")
d9=$(date --date="-2 min" "+ %H:%M:")
d10=$(date --date="-1 min" "+ %H:%M:")
d11=$(date "+ %H:%M:")

cur=$(date "+%Y%m%d")
echo $cur

echo -e "[ "$d1"00 부터 현재시각까지 ]\n----------"
dir="/home1/irteam/logs/apache/apache-2.4.46/access.log.$cur"


grep -E "$d1|$d2|$d3|$d4|$d5|$d6|$d7|$d8|$d9|$d10|$d11|" $dir | awk '{ print $1 }' | sort | uniq -c | sort -nr | head -n 10

echo -e "----------\n\n"
