#!/bin/bash

TIMEZONE=Europe/Paris

dnf -y update

sudo dnf -y install iproute git bind-utils tree openssh-clients sshpass python3.12
curl -k https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
rm get-pip.py
python3 -m pip install ansible-core==2.16.12 ansible-lint==24.9.2 pywinrm
ansible-galaxy collection install ansible.windows community.windows

dnf clean all
python3 -m pip cache purge

echo 'alias ll="ls --group-directories-first -phal --color=auto"' >> ~/.bashrc

rm -rf /etc/localtime && ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone
