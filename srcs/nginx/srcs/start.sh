#!/bin/sh

telegraf & /usr/sbin/sshd & /usr/sbin/nginx -g 'daemon off;'
