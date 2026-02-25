#!/bin/bash

# 检查是否为Debian系列
if [ -f /etc/debian_version ]; then
    echo "Detected Debian-based system."
    sudo DEBIAN_FRONTEND=noninteractive apt update
    sudo DEBIAN_FRONTEND=noninteractive apt install -y wget aria2 curl git screen nmap lrzsz build-essential htop unzip vim net-tools nodejs rsync python3-pip openjdk-11-jdk btop iputils-ping lrzsz
	curl -L https://github.freedns.uk/https://raw.githubusercontent.com/wgetnz/go-install/master/install.sh | bash >/dev/tty0 2>&1
	wget https://github.freedns.uk/https://raw.githubusercontent.com/wgetnz/reinstall/refs/heads/main/.bashrc -O /root/.bashrc
	wget https://github.freedns.uk/https://raw.githubusercontent.com/wgetnz/reinstall/refs/heads/main/.screenrc -O /root/.screenrc
    # 禁用 EDD 探测，消除开机 "Probing EDD" 提示
    sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="\(.*\)"/GRUB_CMDLINE_LINUX_DEFAULT="\1 edd=off"/' /etc/default/grub
    update-grub 2>/dev/null || true
    systemctl stop systemd-resolved
	systemctl disable systemd-resolved
 	rm -rf /etc/resolv.conf
  	echo -e "options timeout:1 attempts:1 rotate\nnameserver 8.8.8.8\nnameserver 223.5.5.5" >/etc/resolv.conf
	echo 127.0.0.1 ubuntu>> /etc/hosts
	
# 检查是否为RedHat系列
elif [ -f /etc/redhat-release ]; then
    echo "Detected RedHat-based system."
	sudo yum update -y
	sudo yum install -y epel-release
    sudo yum install -y wget aria2 curl git screen nmap lrzsz htop unzip vim net-tools nodejs rsync python3-pip java-11-openjdk-devel btop iputils lrzsz --skip-broken
    sudo yum groupinstall -y "Development Tools"
	curl -L https://github.freedns.uk/https://raw.githubusercontent.com/wgetnz/go-install/master/install.sh | bash >/dev/tty0 2>&1
	wget https://github.freedns.uk/https://raw.githubusercontent.com/wgetnz/reinstall/refs/heads/main/.bashrc -O /root/.bashrc
	wget https://github.freedns.uk/https://raw.githubusercontent.com/wgetnz/reinstall/refs/heads/main/.screenrc -O /root/.screenrc
	# 禁用 EDD 探测，消除开机 "Probing EDD" 提示
	sed -i 's/GRUB_CMDLINE_LINUX="\(.*\)"/GRUB_CMDLINE_LINUX="\1 edd=off"/' /etc/default/grub
	grub2-mkconfig -o /boot/grub2/grub.cfg 2>/dev/null || true

else
    echo "Unsupported system. Skipping installation."
fi

