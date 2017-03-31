#!/bin/bash
mkdir -p /var/log/userdata/debian
exec 1>/var/log/userdata/debian/docker.log 2>&1
date
set
set -o verbose
set -o errtrace
set -o xtrace

cd /tmp

# Docker

apt-get -y update
apt-get -y install linux-image-extra-$(uname -r)
modprobe aufs
apt-get -y update
apt-get -y install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-$(lsb_release -cs) main" | tee /etc/apt/sources.list.d/docker.list
apt-get -y update
apt-get -y purge lxc-docker
apt-cache policy docker-engine
apt-get -y install linux-image-extra-$(uname -r)
apt-get -y install docker-engine lxc libsystemd-journal-dev

usermod -a -G docker ubuntu

echo done
exit 0
