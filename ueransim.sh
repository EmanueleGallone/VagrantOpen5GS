sudo apt-get update
sudo apt-get install make g++ libsctp-dev lksctp-tools -y
sudo snap install cmake --classic

sudo git clone https://github.com/aligungr/UERANSIM
cd UERANSIM
sudo make

sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -w net.ipv6.conf.all.forwarding=1
