#!/bin/bash

today=`date +%m-%d-%Y`
filename=$today.json
chatID=-10033333
botToken=123:ddd
workdir=/home/user/django

cd $workdir
python3.11 manage.py dumpdata > $filename
gzip $filename
curl -F chat_id=$chatID -F document=@$filename.gz -F caption="DataBase from Django. Name: BBB" https://api.telegram.org/bot$botToken/sendDocument
rm $filename.gz
