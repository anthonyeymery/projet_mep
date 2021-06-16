#!/bin/sh
#
######### PARAMETERS ###########
HOST_ADDR=192.168.1.167
PORT=8080
JOB_NAME=CI
USERNAME=admin
PWD=password
LOGS=/home/srvadmin/javamovie/movieapp_jar/logs
#
curl -u $USERNAME:$PWD http://$HOST_ADDR:$PORT/job/$JOB_NAME/build?token=movie_jeton
sleep 2m
echo 'Job Ended'
curl -u $USERNAME:$PWD http://$HOST_ADDR:$PORT/job/$JOB_NAME/lastBuild/consoleText > $LOGS/logs_$JOB_NAME.log
cp -f /var/lib/jenkins/workspace/$JOB_NAME/target/movieapp.jar /home/srvadmin/javamovie/movieapp_jar/.
echo 'Script Ended, find logs here: '$LOGS
