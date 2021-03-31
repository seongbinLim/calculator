HOOK_URL=https://hook.dooray.com/services/1590498595903871702/2967507238206945343/xk-5oNRhTnSciLy3vEkrBg
#echo NOMINAL=${NOMINAL}% ACTUAL=${ACTUAL}%
#API_SERVER_JAR_FILE_NAME=`ls /home1/irteam/basecamp-jogiyo.api/target | grep ".jar$"`
#API_SERVER_NUM=`ps -ef | grep -c $API_SERVER_JAR_FILE_NAME`
API_SERVER_NUM=`ps -ef | grep "jogiyo-api.jar" | grep -vc "grep"`

echo `date`
echo -e api server num : $((API_SERVER_NUM)) "\n"

if [ $API_SERVER_NUM -eq 0 ]; then
	echo `ps -ef | grep java`
        `sh /home1/irteam/scripts/run-api.sh`
        `curl -H "Content-Type: application/json" -X POST -d '{"botName": "DeployBot", "botIconImage": "https://static.dooray.com/static_images/dooray-bot.png", "text":"Real02 api server: Deploy started."}' $HOOK_URL`
        echo API Server Deploy started.
fi
