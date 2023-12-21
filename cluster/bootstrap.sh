# Spin up DEMO cluster
k3d cluster create k3s --api-port 6550 -p "8080:80@loadbalancer" --agents 2 > cluster-log.txt &
kubectl create deployment nginx --image=nginx
kubectl create service clusterip nginx --tcp=80:80
kubectl apply -f ingress.yaml
curl localhost:8080