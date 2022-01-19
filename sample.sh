#!/bin/bash
gcloud container clusters get-credentials $1 --region $2 --project $3

helm install sample-shell-release $4
