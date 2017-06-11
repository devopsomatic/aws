#!/bin/bash
NOW=$(date +%Y%m%dt%H%M%S)
UNQ=${NOW}.${RANDOM}
LOGD=/var/log/userdata
[ -w ${LOGD} ] || LOGD=${PWD}
LOG=${LOGD}/bootstrap.${UNQ}.log

exec 3>&1 4>&2
exec 1>${LOG} 2>&1

date
echo args: ${@}
set
set -o verbose
set -o errtrace
set -o xtrace
set -o nounset

VERSION=${VERSION:-master}
DISTRO=${DISTRO:-debian}

for installer in ${@:-salt ${DISTRO}/dev ${DISTRO}/java ${DISTRO}/docker ${DISTRO}/stats}; do
  curl -sL -o- https://raw.githubusercontent.com/devopsomatic/aws/${VERSION}/userdata/${installer}.sh | bash -vx -s --
done
