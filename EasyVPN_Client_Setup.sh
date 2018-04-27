#!/bin/bash -xe

SERVER_IP=$1
PSK=$2

yum -y install openvpn

#/usr/sbin/openvpn

mkdir -p /data/openvpn/{etc,sbin}

##
echo "daemon
cd /data/openvpn/etc/
remote ${SERVER_IP} 1200
proto tcp-client
;proto udp
dev tun
ifconfig 10.8.0.2 10.8.0.1
secret static.key
comp-lzo
keepalive 10 60
ping-timer-rem
persist-tun
persist-key
status openvpn-status.log
;verb 5
cipher AES-128-CBC
" > /data/openvpn/etc/client-static.conf

echo "-----BEGIN OpenVPN Static key V1-----
$PSK
-----END OpenVPN Static key V1----- " > /data/openvpn/etc/static.key

##
echo "#/bin/bash
killall openvpn
/usr/sbin/openvpn --config /data/openvpn/etc/client-static.conf
exit 0" > /data/openvpn/sbin/startup.sh

##
echo "/data/openvpn/sbin/startup.sh" >> /etc/rc.local

##
/usr/sbin/openvpn --config /data/openvpn/etc/client-static.conf

exit 0
