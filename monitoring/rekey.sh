#!/bin/bash

RE_USER=$1
DIR=$OVPN_DATA/user_ovpn/
if [ ! -d "$DIR" ]; then
  echo "${DIR} not found. Please check which folder do you want to put the certificate in."
  exit 1
fi

docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn /bin/sh -c "/bin/echo 'yes'| ovpn_revokeclient $RE_USER"
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full $RE_USER nopass
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient $RE_USER > ${DIR}${RE_USER}.ovpn

docker stop $ContainerName_or_containerID
docker start $ContainerName_or_containerID
