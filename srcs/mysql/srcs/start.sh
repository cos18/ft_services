#!/bin/sh

mkdir -p /run/mysqld
sleep 5
mysql_install_db --user=root
mysqld -u root --bootstrap < /wordpress.sql
mysqld -u root
