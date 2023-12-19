#!/bin/bash

set -ex

yum update -y
yum install -y git

git clone https://github.com/OperationFman/arrbary.git /foobar
cd /foobar/arrbary/cluster

./setup.sh
