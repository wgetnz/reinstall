#!/bin/bash

# 检查是否为Debian系列
if [ -f /etc/debian_version ]; then
    echo "Detected Debian-based system."
    sudo apt update
    sudo apt install -y wget aria2 curl git screen nmap lrzsz build-essential htop unzip vim net-tools nodejs rsync python3-pip openjdk-11-jdk btop  iputils-ping
# 检查是否为RedHat系列
elif [ -f /etc/redhat-release ]; then
    echo "Detected RedHat-based system."
    sudo yum update -y
    sudo yum install -y wget aria2 curl git screen nmap lrzsz htop unzip vim net-tools nodejs rsync python3-pip java-11-openjdk-devel btop iputils-ping
    sudo yum groupinstall -y "Development Tools"
else
    echo "Unsupported system. Skipping installation."
fi
wget https://raw.githubusercontent.com/wgetnz/reinstall/refs/heads/main/.bashrc -O /root/.bashrc
wget https://raw.githubusercontent.com/wgetnz/reinstall/refs/heads/main/.screenrc -O /root/.screenrc
