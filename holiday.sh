#!/bin/sh
LOCATION="桃園"
while [ 1 ]; do
    wget http://www.cpa.gov.tw/ -O index.html;
    iconv -f big5 -t utf8 index.html | grep -A 2 $LOCATION | grep 停止;
    if [ $? != 1 ]; then 
	beep;
    fi
    sleep 1
done