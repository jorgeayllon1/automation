# -*- mode: ruby -*-
# vi: set ft=ruby :

linux_base_box = "almalinux/8"
linux_box_version = "8.10.20240821"
windows_base_box = "gusztavvargadr/windows-server-2022-standard-core"
windows_box_version = "2102.0.2409"

Vagrant.configure("2") do |config|
    config.vm.define "master" do |master|
        master.vm.box = linux_base_box
        master.vm.box_version = linux_box_version
        master.vm.hostname = "master"
        master.vm.network "private_network", ip: "192.168.56.100"
        master.vm.synced_folder '.', '/home/vagrant/workspace/', mount_options: ["dmode=700", "fmode=600", "uid=1000", "gid=1000"]
        master.vm.provider "virtualbox" do |vb|
            vb.memory = 2048
            vb.cpus = 2
        master.vm.provision "shell", path: "./src/script/install-ansible.sh"
        master.ssh.port = 2222
        master.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh"
        end
    end
    config.vm.define "slave" do |slave|
        slave.vm.box = linux_base_box
        slave.vm.box_version = linux_box_version
        slave.vm.hostname = "slave"
        slave.vm.network "private_network", ip: "192.168.56.101"
        slave.vm.synced_folder '.', '/vagrant', disabled: true
        slave.vm.provider "virtualbox" do |vb|
            vb.memory = 2048
            vb.cpus = 1
            slave.vm.provision "shell", path: "./src/script/install-ansible-requirements.sh"
            slave.ssh.port = 2223
            slave.vm.network "forwarded_port", guest: 22, host: 2223, id: "ssh"
        end
    end
    config.vm.provision "shell", path: "./src/script/default-config.sh"
    config.vm.define "principal" do |principal|
        principal.vm.box = windows_base_box
        principal.vm.box_version = windows_box_version
        principal.vm.hostname = "principal"
        principal.vm.network "private_network", ip: "192.168.56.102"
        principal.vm.synced_folder '.', '/vagrant', disabled: true
        principal.vm.provider "virtualbox" do |vb|
            vb.memory = 4096
            vb.cpus = 2
        principal.ssh.port = 2224
        principal.winrm.username = 'Vagrant'
        principal.winrm.password = 'vagrant'
        # SCRIPT : Désactivation de rdp, ipv6
        end
    end
end
