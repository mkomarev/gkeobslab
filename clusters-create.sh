#!/bin/bash

# The script expects two environment variables:
# LAB_REGION specifies GCP cloud region
# LAB_PROJECT_ID specifies GCP project ID

# Create app-cluster for hosting podinfo application and register the cluster in the project's fleet
gcloud container clusters create app-cluster \
--location $LAB_REGION \
--machine-type e2-small \
--num-nodes 1 \
--logging SYSTEM,WORKLOAD,API_SERVER,CONTROLLER_MANAGER,SCHEDULER \
--monitoring SYSTEM,API_SERVER,CONTROLLER_MANAGER,SCHEDULER,POD,DEPLOYMENT,HPA,CADVISOR,KUBELET \
--workload-pool ${LAB_PROJECT_ID}.svc.id.goog \
--enable-fleet \
--quiet

# Enable automatic management of Cloud Service Mesh for the app-cluter cluster
 gcloud container fleet mesh update \
 --management automatic \
 --memberships app-cluster \
 --location $LAB_REGION \
--quiet

# Create load-cluster for hosting traffic generator
gcloud container clusters create-auto load-cluster \
--location $LAB_REGION \
--logging SYSTEM,WORKLOAD,API_SERVER,CONTROLLER_MANAGER,SCHEDULER \
--monitoring SYSTEM,API_SERVER,CONTROLLER_MANAGER,SCHEDULER,POD,DEPLOYMENT,HPA,CADVISOR,KUBELET \
--quiet
