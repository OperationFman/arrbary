# Spin up cluster
k3d cluster create clustarr

# Install ArgoCD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Install ArgoCD CLI
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
echo "y" |  rm argocd-linux-amd64


# Config ArgoCD
argocd login --core
kubectl port-forward svc/argocd-server -n argocd 8912:443

