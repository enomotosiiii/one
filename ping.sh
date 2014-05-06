#!/bin/bash
#使用for循环测试局域网内(192.168.1.0/24)服务器的网络状态
#

[ -f /tmp/down ]
read -p "input your ipadress: " ip
for i in $(echo {1..255})
do
  ip=192.168.1.$i
  j=$(ping -c 1 $ip | grep "transmitted" | cut -d" " -f4)
[ $j -eq 0  ] && echo $ip >> /tmp/down || echo $ip >> /tmp/up
done
[ -f /tmp/down ] && echo "the servers are down "
[ -f /tmp/up ] && echo "the servers are up " 
