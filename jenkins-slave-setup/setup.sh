#!/bin/bash

## Arguments Needed are
# 1. Ip Address of Jenkins , Ex : http://IPadd:port
# 2. Username
# 3. Password

USAGE() {
  echo -e "\e[1;31m Invalid Inputs\e[0m"
  echo -e "\e1m $0 URL(http://IP:8080) USERNAME PASSWORD\e[0m"
  exit 1
}

## Load Arguments
URL=$1
USERNAME=$2
PASSWORD=$3

if [ -z "${URL}" -o -z "${USERNAME}" -o -z "${PASSWORD}"  ]; then
  USAGE
fi

echo All Good
