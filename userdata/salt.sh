#!/bin/bash
LOG=/var/log/userdata/$(basename ${0}).log
mkdir -p $(dirname ${LOG})
exec 1>${LOG} 2>&1
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
