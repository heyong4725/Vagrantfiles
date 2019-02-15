#!/bin/bash
set -e
set -x

SOURCE="${BASH_SOURCE[0]}"
SCRIPTDIR="$( dirname "$SOURCE" )"

export DEBIAN_FRONTEND=noninteractive

echo "Etc/UTC" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata

cd /vagrant

sudo apt-get update -y
sudo apt-get -y install git
sudo apt-get -y install zip

# install Clang and libc++
sudo apt-get install -y build-essential autoconf automake libtool curl make g++ unzip pkg-config wget clang-3.9
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.9 1
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.9 1
sudo apt-get install -y libc++-dev libc++abi-dev libtbb-dev libboost-all-dev

# install cmake
wget https://cmake.org/files/v3.9/cmake-3.9.4-Linux-x86_64.tar.gz
tar xvzf cmake-3.9.4-Linux-x86_64.tar.gz
sudo mv cmake-3.9.4-Linux-x86_64 /usr/bin/cmake
export PATH=$PATH:/usr/bin/cmake/bin
rm cmake-3.9.4-Linux-x86_64.tar.gz

# install protobuf, clonging the protobuf repo
git clone https://github.com/google/protobuf.git
cd protobuf
git submodule update --init --recursive
./autogen.sh
./configure CXX=clang++ CXXFLAGS='-std=c++11 -stdlib=libc++ -O3 -g'
make
make check
sudo make install
sudo ldconfig

# build anna KVS
cd /vagrant
git clone https://github.com/cw75/anna.git
cd anna
bash scripts/build_release.sh


