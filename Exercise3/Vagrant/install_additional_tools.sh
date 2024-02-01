#!/bin/bash

echo -e "\nInstalling additional tools\n"
sudo apt update -y

sudo apt install -y \
    net-tools \
    htop
