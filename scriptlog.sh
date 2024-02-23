#!/bin/bash

timedatectl set-timezone Europe/Moscow
systemctl restart chronyd
cp /vagrant/log-conf/rsyslog.conf /etc/
cp /vagrant/log-conf/auditd.conf /etc/audit/
systemctl restart rsyslog.service
service auditd restart
