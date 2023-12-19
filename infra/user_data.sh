#!/bin/bash

set -ex

# Install Git and clone cluster repo
yum update -y
yum install -y git
git clone https://github.com/OperationFman/arrbary.git /arrbary
cd /arrbary/cluster

sh setup.sh
