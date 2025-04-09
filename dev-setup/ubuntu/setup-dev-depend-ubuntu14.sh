#!/bin/bash
set -e

echo 'Setting up https for apt...'
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates
echo 'Set up https for apt'

echo 'Adding repositories and keys...'

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B9316A7BC7917B12
echo "deb http://ppa.launchpad.net/chris-lea/libsodium/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/chris-lea/libsodium/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61
echo "deb https://hyperledger.jfrog.io/artifactory/indy bionic stable" | sudo tee -a /etc/apt/sources.list

sudo apt-get update
echo 'Added repositories and keys'

echo 'Installing libsodium...'
sudo apt-get install -y libsodium13
echo 'Installed libsodium'

echo 'Installing Libindy...'
sudo apt-get install -y libindy
echo 'Installed Libindy'
