sudo docker swarm init --advertise-addr=192.168.1.128
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh
