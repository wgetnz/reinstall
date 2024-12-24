#!/bin/bash

# 检查是否为Debian系列
if [ -f /etc/debian_version ]; then
    echo "Detected Debian-based system."
    sudo apt update
    sudo apt install -y wget aria2 curl git screen nmap lrzsz build-essential htop unzip vim net-tools nodejs rsync python3-pip openjdk-11-jdk btop  iputils-ping
# 检查是否为RedHat系列
elif [ -f /etc/redhat-release ]; then
    echo "Detected RedHat-based system."
	sudo yum install -y epel-release
    sudo yum install -y wget aria2 curl git screen nmap lrzsz htop unzip vim net-tools nodejs rsync python3-pip java-11-openjdk-devel btop iputils --skip-broken
    sudo yum groupinstall -y "Development Tools"
else
    echo "Unsupported system. Skipping installation."
fi
wget https://github.freedns.uk/https://raw.githubusercontent.com/wgetnz/reinstall/refs/heads/main/.bashrc -O /root/.bashrc
wget https://github.freedns.uk/https://raw.githubusercontent.com/wgetnz/reinstall/refs/heads/main/.screenrc -O /root/.screenrc
