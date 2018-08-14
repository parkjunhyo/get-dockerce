#! /usr/bin/env bash

sudo apt-get update

sudo apt-get install -y\
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install -y docker-ce

dockerservice="/lib/systemd/system/docker.service"
echo "[Service]" >> $dockerservice
echo "ExecStart=" >> $dockerservice
echo "ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375" >> $dockerservice
sudo systemctl daemon-reload
sudo service docker restart

docker info
netstat -anput | grep -i li
