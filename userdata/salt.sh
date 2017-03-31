#!/bin/bash
mkdir -p /var/log/userdata
exec 1>/var/log/userdata/salt.log 2>&1
date
set
set -o verbose
set -o errtrace
set -o xtrace

cd /tmp

curl -L https://bootstrap.saltstack.com -o install_salt.sh && sh install_salt.sh -P
perl -pi -e 's/^#?(master): salt/$1: master.salt.io/' /etc/salt/minion
perl -pi -e 's/^#?(hash_type): .*/$1: sha256/' /etc/salt/minion
service salt-minion restart

echo done
exit 0
