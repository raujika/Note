#!/usr/bin/bash

sudo setenforce 0
systemctl disable firewalld
systemctl stop firewalld
chkconfig smb on
chkconfig nmb on
service nmb restart
service smb restart

