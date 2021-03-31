HOOK_URL=https://hook.dooray.com/services/1590498595903871702/2967507238206945343/xk-5oNRhTnSciLy3vEkrBg
WEB_SERVER_NUM=`ps -ef | grep "tomcat" | grep -c "start"`

echo `date`
echo -e web server num : $((WEB_SERVER_NUM)) "\n"

if [ $WEB_SERVER_NUM -eq 0 ]; then
        `curl -H "Content-Type: application/json" -X POST -d '{"botName": "DeployBot", "botIconImage": "https://static.dooray.com/static_images/dooray-bot.png", "text":"Real02 web server: Deploy started."}' $HOOK_URL`
	echo WEB Server Deploy started.
        `sh /home1/irteam/scripts/deploy_web_auto.sh`
fi
