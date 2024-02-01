#!/bin/bash

OWNER="vagrant"

#---------------------------------------------
echo -e "\nInstalling kubectl\n"
#---------------------------------------------
sudo apt update -y
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

#Validate the binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

#Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client --output=yaml

#---------------------------------------------
echo -e "\nInstalling microk8s\n"
#---------------------------------------------
sudo snap install microk8s --classic
microk8s status --wait-ready

sudo usermod -a -G microk8s $OWNER
sudo chown -f -R $OWNER ~/.kube
sudo newgrp microk8s
