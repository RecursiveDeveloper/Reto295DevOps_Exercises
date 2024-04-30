#!/bin/bash

repo_path="/opt/vagrant/app-295devops-travel"

apt install dos2unix -y
find $repo_path -path $repo_path/app-config -prune -print0 | xargs -0 dos2unix
chmod -R +x $repo_path

echo "Starting services..."
bash $repo_path/start_services.sh
