#!/bin/bash

PORT=9080
APPHOME=/var/lib/git/gitbucket
APPFILE=$APPHOME/gitbucket.war
LOGFILE=/var/log/git/gitbucket.log

cd $APPHOME
java -jar $APPFILE --port=$PORT --prefix=/gitbucket --gitbucket.home=$APPHOME >> $LOGFILE 2>&1
