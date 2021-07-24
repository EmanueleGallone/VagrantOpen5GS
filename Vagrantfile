Vagrant.configure("2") do |config|
  config.vm.define "free5gs" do |c|
    config.vm.provider "virtualbox" do |vb|
      vb.memory = 16000
      vb.cpus = 4
    end

    c.vm.hostname = "free5gs"
    c.vm.box = "ubuntu/bionic64"
    c.vm.network "forwarded_port", guest: 6000, host: 6000
    c.vm.network "forwarded_port", guest: 3000, host: 3000
    c.vm.network :private_network, ip: "192.168.59.10"
    #c.ssh.port = 32100
    c.vm.synced_folder "shared", "/vagrant", disabled: false
  
    c.vm.provision "shell", path: "pre-config.sh"
    c.vm.provision :reload
    c.vm.provision "shell", path: "post-config.sh"
    end

  config.vm.define "ueransim" do |c|

    c.vm.provider "virtualbox" do |vb|
      vb.memory = 4000
      vb.cpus = 2
    end

    c.vm.hostname = "ueransim"
    c.vm.box = "ubuntu/bionic64"
    c.vm.network :private_network, ip: "192.168.59.11"
    c.vm.provision "shell", path: "ueransim.sh"
    #c.vm.network "forwarded_port", guest: 6000, host: 6001
    #c.vm.synced_folder "shared", "/vagrant", disabled: false
  end

end
