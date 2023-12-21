# Spin up DEMO cluster
k3d cluster create clustarr --api-port 6550 -p "8081:80@loadbalancer" --agents 2
export KUBECONFIG="$(k3d kubeconfig write k3s-default)"
kubectl create deployment nginx --image=nginx
kubectl create service clusterip nginx --tcp=80:80
kubectl apply -f ingress.yaml
curl localhost:8081/