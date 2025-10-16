#!/bin/bash

# The script expects LAB_REGION environment variable to specify GCP cloud region

# Get kubectl credentials to access the target cluster for deployment
gcloud container clusters get-credentials load-cluster --region $LAB_REGION 

# Set kubectl current context in 'locust' namespace
kubectl config set-context --current --namespace=locust

# Delete locust service of LoadBalancer kind
kubectl delete service locust-master-web

# Delete locust service of ClusterIP kind
kubectl delete service locust-master

# Delete locust service of NodePort kind
kubectl delete service locust-service-nodeport

# Delete locust-worker deployment
kubectl delete deployment locust-worker

# Delete locust-master deployment
kubectl delete deployment locust-master

# Delete locustfile-cm configmap
kubectl delete configmap locustfile-cm

# Delete env-cm configmap
kubectl delete configmap env-cm

# Delete locust-namespace
kubectl delete namespace locust

# Set kubectl current context in 'default' namespace
kubectl config set-context --current --namespace=default