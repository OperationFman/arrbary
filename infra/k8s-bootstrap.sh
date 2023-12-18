#!/bin/bash
set -ex

# Install Docker
sudo yum update -y
sudo amazon-linux-extras install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on

 # Install Kubectl, Helm and K3d
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo curl -s https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
sudo curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# Init cluster
k3d cluster create mycluster -p "8900:30080@agent:0" -p "8901:30081@agent:0" -p "8902:30082@agent:0" --agents 2

# Install Rancher
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm install rancher rancher-latest/rancher \
   --namespace cattle-system \
   --create-namespace \
   --set ingress.enabled=false \
   --set tls=external \
   --set replicas=1