#!/bin/bash

sudo apt-get -y update
sudo apt-get -y install docker-compose-plugin

docker compose version
