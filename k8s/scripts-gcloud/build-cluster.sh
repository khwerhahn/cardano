#!/bin/bash -xe
gcloud compute networks create application --mode auto
gcloud container clusters create application \
        --network application \
        --disk-size=200
        --machine-type=g1-small \
        --scopes "https://www.googleapis.com/auth/projecthosting,storage-rw" \
        --num-nodes=1 \
        --enable-autoscaling --min-nodes=1 --max-nodes=10
gcloud container clusters list
gcloud container clusters get-credentials application
kubectl cluster-info
kubectl create ns application
kubectl apply -f ../cardano-sl/production
kubectl get pods --namespace application
