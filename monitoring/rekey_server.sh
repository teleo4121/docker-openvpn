#!/bin/sh


server_cn="$IP"

mv /etc/openvpn/pki/reqs/$server_cn.req /etc/openvpn/pki/reqs/$server_cn.req.backup
mv /etc/openvpn/pki/private/$server_cn.key /etc/openvpn/pki/private/$server_cn.key.backup
mv /etc/openvpn/pki/issued/$server_cn.crt /etc/openvpn/pki/issued/$server_cn.crt.backup
cd /etc/openvpn
easyrsa build-server-full $server_cn nopass
