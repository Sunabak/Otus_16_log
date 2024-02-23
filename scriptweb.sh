#!/bin/bash

timedatectl set-timezone Europe/Moscow
systemctl restart chronyd
yum install epel-release -y
yum install nginx -y
yum install audispd-plugins -y
cp /vagrant/web-conf/nginx.conf /etc/nginx/
cp /vagrant/web-conf/audit.rules /etc/audit/rules.d/
cp /vagrant/web-conf/auditd.conf /etc/audit/
cp /vagrant/web-conf/au-remote.conf /etc/audisp/plugins.d/
cp /vagrant/web-conf/audisp-remote.conf /etc/audisp/
systemctl start nginx
service auditd restart
