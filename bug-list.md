
# Know Bugs
 - [X] Duplicated processes when first run, won't occur after reboot

Submitted date: 2018/04/29
Solved date: 2018/04/30
Reason: Cloud-Init run before rc.local. Don't need to run rc.local content about openvpn again

```Bash
[root@ip-172-31-9-127 ~]# ps aux | grep openvpn
root      2684  0.0  0.4  45556  4476 ?        Ss   Apr28   0:15 /usr/sbin/openvpn --config /data/openvpn/etc/client-static.conf
root      2705  0.0  0.3 115224  3116 ?        S    Apr28   0:00 /bin/bash /data/openvpn/sbin/vpn_monitor.sh
root      2765  0.0  0.4  45556  4488 ?        Ss   Apr28   0:00 /usr/sbin/openvpn --config /data/openvpn/etc/client-static.conf
root      2778  0.0  0.3 115220  3156 ?        S    Apr28   0:00 /bin/bash /data/openvpn/sbin/vpn_monitor.sh
root      9271  0.0  0.2 110468  2084 pts/0    S+   15:14   0:00 grep --color=auto openvpn
[root@ip-172-31-9-127 ~]# iprule
-bash: iprule: command not found
[root@ip-172-31-9-127 ~]# ip rule
0:      from all lookup local
32762:  from 172.31.9.127 lookup main
32763:  from 172.31.0.0/16 lookup vpn
32764:  from 172.31.9.127 lookup main
32765:  from 172.31.0.0/16 lookup vpn
```
