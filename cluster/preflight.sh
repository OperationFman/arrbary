#!/bin/bash
set -ex

# Install Docker
yum install -y docker
service docker start

 # Install Kubectl, K3d and Helm
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
# curl -s https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash