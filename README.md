#!/bin/bash
gcloud container clusters get-credentials my-gke-tf-cluster --region us-central1 --project airline1-sabre-wolverine

helm install sample-shell-release ../k8s-deployment-helm/sample

gcloud container clusters get-credentials $1 --region $2 --project $3

helm install $4 $5