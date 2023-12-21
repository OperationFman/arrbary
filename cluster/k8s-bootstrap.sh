# Spin up cluster
k3d cluster create clustarr
kubectl apply -f admin-user.yaml

# Install K8s dashboard
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard
helm install dashboard kubernetes-dashboard/kubernetes-dashboard
export POD_NAME=$(kubectl get pods -n default -l "app.kubernetes.io/name=kubernetes-dashboard,app.kubernetes.io/instance=dashboard" -o jsonpath="{.items[0].metadata.name}")
kubectl -n default port-forward $POD_NAME 8443:8443
kubectl -n default create token admin-user > token.txt