#!/bin/bash
set -ex

# Install Docker
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on

 # Install Kubectl, Helm and K3d
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo curl -s https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
sudo curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
