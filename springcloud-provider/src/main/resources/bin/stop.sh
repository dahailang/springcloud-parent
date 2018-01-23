#!/bin/bash
###########################################################################
# @author: wangjn 
# @desc: stop springcloud-provider
# @time: 2018-01-18 
###########################################################################
SERVER_NAME=springcloud-provider
DEPLOY_DIR=/redis/springcloud/provider/springcloud-provider-0.0.2-RELEASES.jar

PIDS=`ps -ef | grep java | grep "${DEPLOY_DIR}" |awk '{print $2}'`
if [ -z "$PIDS" ]; then
    echo "ERROR: The $SERVER_NAME does not started!"
    exit 1
fi

echo -e "Stopping the $SERVER_NAME ...\c"
for PID in $PIDS ; do
    kill $PID > /dev/null 2>&1
done

COUNT=0
while [ $COUNT -lt 1 ]; do    
    echo -e ".\c"
    sleep 1
    COUNT=1
    for PID in $PIDS ; do
        PID_EXIST=`ps -f -p $PID | grep java`
        if [ -n "$PID_EXIST" ]; then
            COUNT=0
            break
        fi
    done
done

echo "OK!"
echo "PID: $PIDS"