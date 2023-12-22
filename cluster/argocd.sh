# Install ArgoCD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Install ArgoCD CLI
VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
curl -sSL -o argocd-darwin-arm64 https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-darwin-arm64
sudo install -m 555 argocd-darwin-arm64 /usr/local/bin/argocd
rm argocd-darwin-arm64

# Config ArgoCD
kubectl port-forward svc/argocd-server -n argocd 8080:443
# TODO Set password using a secret


# Spin up DEMO app
kubectl config set-context --current --namespace=argocd
argocd app create guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path guestbook --dest-server https://kubernetes.default.svc --dest-namespace default
argocd app get guestbook
argocd app sync guestbook
