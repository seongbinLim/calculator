TOTAL=`free | grep ^Mem | awk '{print $2}'`
USED1=`free | grep ^Mem | awk '{print $3}'`
USED2=`free | grep ^-/+ | awk '{print $3}'`
NOMINAL=$((100*USED1/TOTAL))
ACTUAL=$((100*USED2/TOTAL))
HOOK_URL=https://hook.dooray.com/services/1590498595903871702/2967507238206945343/xk-5oNRhTnSciLy3vEkrBg

if [ $ACTUAL -gt $1 ];then
        echo API/WEB Server Deploy started.
        curl -H "Content-Type: application/json" -X POST -d '{"botName": "DeployBot", "botIconImage": "https://static.dooray.com/static_images/dooray-bot.png", "text":"Memory usage has been exceeded. \n Real02 API/WEB server: Deploy started."}' $HOOK_URL
        `sh /home1/irteam/scripts/run-api.sh`
        `sh /home1/irteam/scripts/deploy_web_auto.sh`
fi

echo NOMINAL=${NOMINAL}% ACTUAL=${ACTUAL}%
echo -e `date` "\n"
