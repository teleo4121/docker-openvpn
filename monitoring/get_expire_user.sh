#!/bin/bash

greped_CN=( "$( docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn ovpn_listclients | grep 'CN' )" )
printf '%s\n' "${greped_CN[@]}"

