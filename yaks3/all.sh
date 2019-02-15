#!/bin/bash
set -e
set -x

SOURCE="${BASH_SOURCE[0]}"
SCRIPTDIR="$( dirname "$SOURCE" )"

export DEBIAN_FRONTEND=noninteractive

echo "Etc/UTC" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata

sudo apt-get update -y

sudo apt-get -y install git
sudo apt-get -y install zip
sudo apt -y install maven

sudo apt-get install python3
sudo apt-get install -y python3-pip
sudo apt-get install -y python-sphinx

sudo pip3 install jsonschema
sudo pip3 install jsonpickle
sudo pip3 install argcomplete

sudo pip3 install setuptools
sudo pip3 install websockets flask
sudo apt-get install python-sphinx

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update -y
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-installer

cd /vagrant/cmake
tar xvf cmake-3.11.0-Linux-x86_64.tar.gz
export PATH="/vagrant/cmake/cmake-3.11.0-Linux-x86_64/bin:$PATH"

