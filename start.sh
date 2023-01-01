#!/bin/bash

kubectl apply -f /Users/chriswilmott/projects/gitlab/db_api/pg-volume.yaml 
kubectl apply -f /Users/chriswilmott/projects/gitlab/db_api/pg-claim.yaml
kubectl apply -f /Users/chriswilmott/projects/gitlab/db_api/postgres-configmap.yaml
kubectl apply -f /Users/chriswilmott/projects/gitlab/db_api/k8.yaml

docker exec -it minikube mkdir -p /mnt/postgres

docker cp /tmp/postgres/api.sql minikube:/mnt/postgres
