#!/bin/bash -xe

yum -y install openvpn

#/usr/sbin/openvpn

mkdir -p /data/openvpn/{etc,sbin}

##
echo "daemon
;mode server
cd /data/openvpn/etc/
dev tun
proto tcp-server
;proto udp
port 1200
secret static.key
ifconfig 10.8.0.1 10.8.0.2
comp-lzo
keepalive 10 60
ping-timer-rem
persist-tun
persist-key
persist-key
persist-tun
status openvpn-status.log
;verb 5
cipher AES-128-CBC
" > /data/openvpn/etc/server-static.conf

echo "-----BEGIN OpenVPN Static key V1-----
$1
-----END OpenVPN Static key V1----- " > /data/openvpn/etc/static.key

##
echo "#/bin/bash
killall openvpn
/usr/sbin/openvpn --config /data/openvpn/etc/server-static.conf
exit 0" > /data/openvpn/sbin/startup.sh

##
echo "/data/openvpn/sbin/startup.sh" >> /etc/rc.local

##
/usr/sbin/openvpn --config /data/openvpn/etc/server-static.conf




echo "#test scripts to rc.local" >> /etc/rc.local

exit 0
