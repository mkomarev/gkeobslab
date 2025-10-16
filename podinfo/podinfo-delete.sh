#!/bin/bash

# The script expects LAB_REGION environment variable to specify GCP cloud region

# Get kubectl credentials to access the target cluster for deployment
gcloud container clusters get-credentials app-cluster --region $LAB_REGION 

# Set kubectl current context in 'podinfo' namespace
kubectl config set-context --current --namespace=podinfo

# Delete podinfo service of LoadBalancer kind
kubectl delete service podinfo-service-lb

# Delete podinfo service of ClusterIP kind
kubectl delete service podinfo-service-clusterip

# Delete podinfo HPA
kubectl delete hpa podinfo

# Delete podinfo deployment
kubectl delete deployment podinfo

# Delete podinfo namespace
kubectl delete namespace podinfo

# Set kubectl current context in 'default' namespace
kubectl config set-context --current --namespace=default