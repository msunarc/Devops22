#!/bin/bash 
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo su -- 
yum update –y
wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
amazon-linux-extras install epel -y
yum upgrade
yum install jenkins java-1.8.0-openjdk-devel -y
systemctl daemon-reload
systemctl start jenkins