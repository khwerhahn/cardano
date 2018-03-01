#!/bin/bash -xe
printf "y\n" | gcloud container clusters delete application || true
printf "y\n" | gcloud compute disks delete cardano || true
for rule in $(gcloud compute firewall-rules list --filter network=application --format='value(name)');do
  printf "y\n" | gcloud compute firewall-rules delete $rule || true
done
printf "y\n" | gcloud compute networks delete application || true
for rule in $(gcloud compute forwarding-rules list  --regexp '.*application-application.*'  --format='value(name)');do
  printf "y\n" | gcloud compute forwarding-rules delete $rule --global
done
for address in $(gcloud compute addresses list --regexp '.*-application-application.*'  --format='value(name)');do
  printf "y\n" | gcloud compute addresses delete $address --global
done
for proxy in $(gcloud compute target-https-proxies list  --regexp '.*application-application.*'  --format='value(name)');do
  printf "y\n" | gcloud compute target-https-proxies delete $proxy
done
for cert in $(gcloud compute ssl-certificates list --regexp 'k8s-ssl-application-application.*'  --format='value(name)');do
  printf "y\n" | gcloud compute ssl-certificates delete $cert
done
for target in $(gcloud compute target-pools list --regexp '.*-application-application.*'  --format='value(name)');do
  printf "y\n" | gcloud compute target-pools delete $target
done
for target in $(gcloud compute target-http-proxies list --regexp '.*-application-application.*'  --format='value(name)');do
  printf "y\n" | gcloud compute target-http-proxies delete $target
done
for url in $(gcloud compute url-maps list --regexp '.*-application-application.*'  --format='value(name)');do
  printf "y\n" | gcloud compute url-maps delete $url
done
