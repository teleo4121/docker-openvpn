#!/bin/bash

FOLDER="monitoring"
EMAIL_ADDRESS=""

notify=0

ROOTKEY=`sh ${FOLDER}/check_rootkey.sh`
if [[ $? -eq 1 ]]
then
  notify=1
fi

OUTPUT=`sh ${FOLDER}/get_expire_user.sh`
if [[ ! -z "$OUTPUT" ]] 
then
  notify=1
fi 

if [[ $notify -eq 1 ]]
then

  TEXT="► EXPIRED DAY of ROOT KEY = ${ROOTKEY}, please re-key."
  TEXT2="► Seems there are some of user's certificate expired, \n   please check and re-key. \n  users: \n  ${OUTPUT}"

  printf "${TEXT} \n\n ${TEXT2}" | mail -s "VPN WRANNING" $EMAIL_ADDRESS
 
fi
