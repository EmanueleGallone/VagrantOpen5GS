sudo apt-get update
sudo apt-get install make g++ libsctp-dev lksctp-tools -y
sudo snap install cmake --classic

sudo git clone https://github.com/EmanueleGallone/UERANSIM
cd UERANSIM
sudo make

sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -w net.ipv6.conf.all.forwarding=1

sudo iptables -t nat -A POSTROUTING -s 10.45.0.0/16 ! -o ogstun -j MASQUERADE
sudo ip6tables -t nat -A POSTROUTING -s 2001:230:cafe::/48 ! -o ogstun -j MASQUERADE
