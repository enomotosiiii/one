#!/bin/bash
#
echo"
skip-grant-tables 
skip-networking
">>/etc/my.cnf
/etc/init.d/mysqld restart
mysql
update mysql.user set password=password("uplooking") where user="root" and host="localhost";
exit
sed -i '/skip-grant-tables/d' /etc/my.cnf
sed -i '/skip-networking/d' /etc/my.cnf
/etc/init.d/mysqld restart
