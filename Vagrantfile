# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "master" => {"memory" => "1024", "cpu" => "1", "ip" => "128", "image" => "bento/ubuntu-22.04"},
  "node1" => {"memory" => "1024", "cpu" => "1", "ip" => "129", "image" => "bento/ubuntu-22.04"},
  "node2" => {"memory" => "1024", "cpu" => "1", "ip" => "130", "image" => "bento/ubuntu-22.04"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "private_network", ip: "192.168.1.#{conf["ip"]}"
      machine.vm.provider "vitualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]

      end
      machine.vm.provision "shell", path: "docker.sh"

      if "#{name}" == "master"
        machine.vm.provision "shell", path: "master.sh"
      else
        machine.vm.provision "shell", path: "worker.sh"
      end

    end
  end
end
