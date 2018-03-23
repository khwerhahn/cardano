#!/bin/bash -xe
kubectl delete service daedalus
kubectl delete service cardano-sl
kubectl delete deployment daedalus
kubectl delete deployment cardano-sl
kubectl delete persistentvolumeclaim cardano-sl-claim0
kubectl delete persistentvolumeclaim daedalus-claim0
kubectl delete persistentvolumeclaim cardano-tls
kubectl delete persistentvolume --all
minikube stop
