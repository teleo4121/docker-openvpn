#!/bin/bash


expiryDays=$(( ($(date -d "$(openssl x509 -in $OVPN_DATA/pki/ca.crt -enddate -noout | cut -d= -f2)" '+%s') - $(date '+%s')) / 86400 ))

if [ $expiryDays -gt 5 ]; then
   echo "Wildcard certificate works normally: $expiryDays days"; 
   exit 0;
else  
   echo "Need to renew wildcard certificate";
   exit 2;
fi
