#!/bin/bash

## Arguments Needed are
# 1. Ip Address of Jenkins , Ex : http://IPadd:port
# 2. Username
# 3. Password

USAGE() {
  echo -e "\e[1;31m Invalid Inputs\e[0m"
  echo -e "\e[1m $0 URL(http://IP:8080) USERNAME PASSWORD AGENTNAME \e[0m"
  exit 1
}

## Load Arguments
URL=$1
USERNAME=$2
PASSWORD=$3
AGENTNAME=$4

if [ -z "${URL}" -o -z "${USERNAME}" -o -z "${PASSWORD}" -o -z "${AGENTNAME}"  ]; then
  USAGE
fi

# Install Java
type java &>/dev/null
if [ $? -ne 0 ]; then
  echo -e "\e[1;31m Java is missing, Ensure you install it\e[0m"
  exit 2
fi
# Download cli jar file
# Create Agent with CLI
# Setup xml file with agent name
# Configure Agent with CLI
# Setup jenkins startup script
