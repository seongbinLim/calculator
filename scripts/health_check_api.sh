#!/bin/bash

#health check
while true 
do
        response=$(curl -X GET http://10.161.106.75:8081/monitor/l7check)

        if [ $response ]; then 
		break
	fi

	echo "health check fail";
        sleep 10;
done
echo "health check success";
