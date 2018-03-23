#!/bin/bash -xe

kubectl delete service daedalus
kubectl delete service cardano-sl
kubectl delete deployment daedalus
kubectl delete deployment cardano-sl
kubectl delete persistentvolumeclaim cardano-sl-claim0
kubectl delete persistentvolumeclaim daedalus-claim0
kubectl delete persistentvolumeclaim cardano-tls
kubectl delete persistentvolume --all
sleep 10
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
minikube service daedalus
