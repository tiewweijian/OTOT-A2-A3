#!/bin/bash
echo Starting A2 Bash Script


echo Creating Cluster
kind create cluster --name kind-1 --config ../kind/cluster-config.yaml

wait

echo Loading image into cluster Kind-1
kind load docker-image otot-a1-1-app --name kind-1

wait

echo Apply backend deployment
kubectl apply -f backend-deployment.yaml 

wait

#kubectl label node kind-1-worker ingress-ready=true

#kubectl label node kind-1-worker2 ingress-ready=true
#kubectl label node kind-1-worker3 ingress-ready=true

echo Apply Service Backend
kubectl apply -f service-deployment.yaml 

wait

echo Apply ingress from online
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

sleep 60

echo Apply ingress config 
kubectl apply -f ingress.yaml            