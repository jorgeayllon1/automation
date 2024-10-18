#!/bin/bash

sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
echo 'PasswordAuthentication no' | sudo tee -a /etc/ssh/sshd_config && sudo systemctl restart sshd
