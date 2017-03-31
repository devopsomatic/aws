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

# Stats

wget https://dl.influxdata.com/telegraf/releases/telegraf_1.2.1_amd64.deb
dpkg -i telegraf_1.2.1_amd64.deb

apt-get -y install htop sysstat collectl dstat

perl -pi -e 's/false/true/' /etc/default/sysstat
perl -pi -e 's|5-55/10|*/1|' /etc/cron.d/sysstat
service sysstat restart

echo done
exit 0
