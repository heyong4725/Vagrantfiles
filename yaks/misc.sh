#!/bin/bash
set -e
set -x

export DEBIAN_FRONTEND=noninteractive

echo "Etc/UTC" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata

sudo apt-get update -y
sudo apt-get install -y ntp

sudo service ntp restart
sudo ntpq -c lpeer

sudo apt-get -y install git
sudo apt-get -y install zip
sudo apt -y install cmake 
sudo apt -y install maven

sudo apt-get install python3
python3

sudo apt install python3-pip
pip3 install setuptools
pip3 install websockets flask


cd /vagrant/cmake
tar xvf cmake-3.11.0-Linux-x86_64.tar.gz


export PATH="/vagrant/cmake/cmake-3.11.0-Linux-x86_64/bin:$PATH"

