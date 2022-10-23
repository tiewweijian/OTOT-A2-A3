#!/bin/bash

# kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# remember to add --kubelet-insecure-tls in deployment.spec.containers[].args[]
# kubectl -nkube-system edit deploy/metrics-server
# kubectl -nkube-system rollout restart deploy/metrics-server

#kubectl apply -f HorizontalPodAutoscaler.yaml 

#kubectl get hpa

#ab -n 2000 -c 200 localhost/app

#sleep 20

#kubectl get hpa 

#kubectl describe hpa 

kubectl get nodes -L topology.kubernetes.io/zone

kubectl apply -f backend-deployment-zoning.yaml      

kubectl get po -lapp=backend-zone-aware -owide --sort-by='.spec.nodeName'