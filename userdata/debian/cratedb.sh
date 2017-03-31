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

# CrateDB

bash -c "$(curl -L install.crate.io)"

echo done
exit 0
