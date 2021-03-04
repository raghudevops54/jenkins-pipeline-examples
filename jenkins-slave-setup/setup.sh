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

# Check Java
type java &>/dev/null
if [ $? -ne 0 ]; then
  echo -e "\e[1;31m Java is missing, Ensure you install it\e[0m"
  exit 2
fi

# Download cli jar file
curl -f -s -o /tmp/cli.jar  ${URL}/jnlpJars/jenkins-cli.jar
if [ $? -ne 0 ]; then
  echo -e "\e[1;31m Unable to Download Jenkins CLI"
  exit 2
fi

#
java -jar /tmp/cli.jar -auth ${USERNAME}:${PASSWORD} -s ${URL} get-node ${AGENTNAME}

exit 

# Create Agent with CLI
sed -e "s/AGENTNAME/${AGENTNAME}/" | java -jar /tmp/cli.jar -auth ${USERNAME}:${PASSWORD} -s ${URL} create-node ${AGENTNAME}

# Setup xml file with agent name
# Configure Agent with CLI
# Setup jenkins startup script
