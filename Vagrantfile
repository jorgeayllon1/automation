# -*- mode: ruby -*-
# vi: set ft=ruby :

base_box = "almalinux/8"
box_version = "8.10.20240821"

Vagrant.configure("2") do |config|
    config.vm.define "master" do |master|
        master.vm.box = base_box
        master.vm.box_version = box_version
        master.vm.hostname = "master"
        master.vm.network "private_network", ip: "192.168.56.100"
        master.vm.synced_folder '.', '/home/vagrant/workspace/', mount_options: ["dmode=700", "fmode=600", "uid=1000", "gid=1000"]
        master.vm.provider "virtualbox" do |vb|
            vb.memory = 1024
            vb.cpus = 2
            master.vm.provision "shell", path: "./src/script/install-ansible.sh"
            master.ssh.port = 2222
            master.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh"
        end
    end
    config.vm.define "slave" do |slave|
        slave.vm.box = base_box
        slave.vm.box_version = box_version
        slave.vm.hostname = "slave"
        slave.vm.network "private_network", ip: "192.168.56.101"
        slave.vm.synced_folder '.', '/vagrant', disabled: true
        slave.vm.provider "virtualbox" do |vb|
            vb.memory = 512
            vb.cpus = 1
            slave.vm.provision "shell", path: "./src/script/install-ansible-requirements.sh"
            slave.ssh.port = 2223
            slave.vm.network "forwarded_port", guest: 22, host: 2223, id: "ssh"
        end
    end
    config.vm.provision "shell", path: "./src/script/default-config.sh"
end
