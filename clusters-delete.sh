#!/bin/bash

# The script expects LAB_REGION environment variable to specify GCP cloud region

# Remove app-cluster from the fleet in the lab's project
gcloud container clusters update app-cluster \
--clear-fleet-project \
--region=$LAB_REGION \
--quiet

# Delete app-cluster and load-cluster
gcloud container clusters delete app-cluster load-cluster \
--region=$LAB_REGION \
--quiet