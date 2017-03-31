#!/bin/bash
mkdir -p /var/log/userdata/debian
exec 1>/var/log/userdata/debian/java.log 2>&1
date
set
set -o verbose
set -o errtrace
set -o xtrace

cd /tmp

# Java

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
add-apt-repository -y ppa:webupd8team/java
apt-get update
apt-get -y install oracle-java8-installer

echo done
exit 0
