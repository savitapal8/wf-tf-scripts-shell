#!/bin/bash
gcloud container clusters get-credentials my-gke-tf-cluster --region us-central1 --project airline1-sabre-wolverine

helm install sample-shell-release ../k8s-deployment-helm/sample
