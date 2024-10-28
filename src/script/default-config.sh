#!/bin/bash

sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
echo 'PasswordAuthentication no' | sudo tee -a /etc/ssh/sshd_config && sudo systemctl restart sshd
sudo dnf update -y
sudo dnf install -y kernel-headers kernel-devel gcc cpp perl make elfutils-libelf-devel
sudo dnf clean all
