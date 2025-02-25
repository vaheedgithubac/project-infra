#!/bin/env bash

sudo dnf update
sudo curl -fsSL -o /tmp/mysql80-community-release-el9-1.noarch.rpm https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
#sudo cd /tmp
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023
sudo dnf install /tmp/mysql80-community-release-el9-1.noarch.rpm -y
sudo dnf install mysql-community-client -y
# sudo dnf install mysql-community-server -y
mysql --version
