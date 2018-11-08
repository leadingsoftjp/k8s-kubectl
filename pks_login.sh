#!/bin/sh

API_URL=$1
PKS_USER=$2
PKS_PWD=$3
K8S_CLUSTER=$4

expect -c "
set timeout -1
spawn pks login -a $API_URL -u $PKS_USER -k
expect \"Password:\"
send $PKS_PWD\n
expect \"User: $PKS_USER\"
spawn pks get-credentials $K8S_CLUSTER
expect \"Password:\"
send $PKS_PWD\n
expect \"<cluster-name>\"
"
