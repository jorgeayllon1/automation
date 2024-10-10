Vagrant.configure("2") do |config|
    config.vm.define "vm1" do |vm1|
        vm1.vm.box = "almalinux/8"
        vm1.vm.hostname = "vm1"
        vm1.vm.network "public_network", ip: "192.168.1.100"
        vm1.vm.provider "virtualbox" do |vb|
            vb.memory = "512"
            vb.cpus = 1
        end
    end
end