#!/bin/bash -xe
minikube start
kubectl apply -f ../cardano-sl-claim0-persistentvolumeclaim.yaml
kubectl apply -f ../cardano-tls-persistentvolumeclaim.yaml
kubectl apply -f ../daedalus-claim0-persistentvolumeclaim.yaml
sleep 5
kubectl apply -f ../cardano-sl-deployment.yaml
kubectl apply -f ../cardano-sl-service.yaml
sleep 10
kubectl apply -f ../daedalus-deployment.yaml
kubectl apply -f ../daedalus-service.yaml
echo "Cardano & Daedalus running"
echo "Waiting until up"
sleep 10
minikube dashboard
minikube service daedalus
