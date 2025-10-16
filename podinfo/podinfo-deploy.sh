#!/bin/bash

# The script expects LAB_REGION environment variable to specify GCP cloud region

# Get kubectl credentials to access the target cluster for deployment
gcloud container clusters get-credentials app-cluster --region $LAB_REGION 

# Deploy the application and expose it as a service with external load balancer
kubectl apply -f podinfo-namespace.yaml -f podinfo.yaml -f podinfo-service.yaml