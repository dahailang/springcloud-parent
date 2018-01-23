#!/bin/bash

###########################################################################
# @author: wangjn 
# @desc: start springcloud-provider
# @time: 2018-01-18 
###########################################################################
export JAVA_HOME=/usr/java/jdk1.8.0_121
export PATH=$JAVA_HOME/bin:$PATH

SERVER_NAME=springcloud-provider
DEPLOY_DIR=/redis/springcloud/provider
STDOUT_FILE=${DEPLOY_DIR}/logs/provider.log
WAR_FILE=${DEPLOY_DIR}/springcloud-provider-0.0.2-RELEASES.jar

PIDS=`ps -f | grep java | grep "${DEPLOY_DIR}" |awk '{print $2}'`
if [ -n "$PIDS" ]; then
    echo "ERROR: The ${SERVER_NAME} already started!"
    echo "PID: $PIDS"
    exit 1
fi
##节约内存资源
#JAVA_OPTS="-server -Xmx512M -Xms512M -Xss256k -XX:MaxDirectMemorySize=512M -XX:+UseG1GC -XX:MaxGCPauseMillis=200 -XX:G1ReservePercent=25 -XX:InitiatingHeapOccupancyPercent=40 -XX:+PrintGCDateStamps -Xloggc:${DEPLOY_DIR}/logs/gc.log -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=100M -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=${DEPLOY_DIR}/logs/java.hprof -XX:+DisableExplicitGC -XX:-OmitStackTraceInFastThrow -XX:+PrintCommandLineFlags -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Djava.util.Arrays.useLegacyMergeSort=true -Dfile.encoding=UTF-8"
JAVA_OPTS="-server -Xloggc:${DEPLOY_DIR}/logs/gc.log  -XX:HeapDumpPath=${DEPLOY_DIR}/logs/java.hprof -Dfile.encoding=UTF-8"

echo -e "Starting the ${SERVER_NAME} ...\c"
nohup java $JAVA_OPTS -jar ${WAR_FILE} > $STDOUT_FILE 2>&1 &
COUNT=0
while [ $COUNT -lt 1 ]; do    
    echo -e ".\c"
    sleep 1 
    COUNT=`ps -f | grep java | grep "${DEPLOY_DIR}" | awk '{print $2}' | wc -l`
    if [ $COUNT -gt 0 ]; then
        break
    fi
done

echo "OK!"
PIDS=`ps -f | grep java | grep "${DEPLOY_DIR}" | awk '{print $2}'`
echo "PID: $PIDS"
echo "STDOUT: $STDOUT_FILE"
tail -f $STDOUT_FILE


