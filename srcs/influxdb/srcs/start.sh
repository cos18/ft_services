#!/bin/sh

influxd -config /etc/influxdb.conf & telegraf start
