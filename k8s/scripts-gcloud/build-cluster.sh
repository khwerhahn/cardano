#!/bin/bash -xe
gcloud compute networks create application --mode auto
gcloud alpha container clusters create application \
        --network application \
        --machine-type=n1-standard-1 \
        --scopes "https://www.googleapis.com/auth/projecthosting,storage-rw" \
        --num-nodes=3 \
        --enable-autoscaling --min-nodes=3 --max-nodes=5
gcloud container clusters list
gcloud container clusters get-credentials application
kubectl cluster-info
kubectl create ns application
gcloud compute images create cardano --size=200GB
kubectl apply -f ../cardano-sl
kubectl get pods --namespace application
