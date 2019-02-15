#!/usr/bin/env bash

apt-get update
apt-get -y upgrade

wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz
sudo tar -xvf go1.8.linux-amd64.tar.gz
sudo mv go /usr/local

export GOROOT=/usr/local/go
export GOPATH=$HOME
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH


apt-get install -y apache2
if ! [ -L /var/www ]; then
	rm -rf /var/www
	ln -fs /vagrant /var/www
fi

