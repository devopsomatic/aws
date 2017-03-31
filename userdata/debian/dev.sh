#!/bin/bash
LOG=/var/log/userdata/debian/$(basename ${0}).log
mkdir -p $(dirname ${LOG})
exec 1>${LOG} 2>&1
date
set
set -o verbose
set -o errtrace
set -o xtrace

cd /tmp

# Dev

apt-get -y install git unzip p7zip-full tmux build-essential htop
apt-get -y install libgeos-dev libgdal-dev libpq-dev
apt-get -y install libsnappy-dev autoconf automake libtool pkg-config
apt-get -y install libblas-dev liblapack-dev libatlas-base-dev gfortran
apt-get -y install python3-virtualenv python3-dev
apt-get -y build-dep python3-matplotlib

apt-get -y upgrade
apt-get -y dist-upgrade

echo done
exit 0
