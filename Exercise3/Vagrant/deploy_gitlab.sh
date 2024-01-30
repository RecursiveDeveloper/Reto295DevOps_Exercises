#!/bin/bash

gitlab_manifests_path=$1
gitlab_namespace=$2

microk8s kubectl create ns $gitlab_namespace
microk8s kubectl apply -f $gitlab_manifests_path -n $gitlab_namespace
