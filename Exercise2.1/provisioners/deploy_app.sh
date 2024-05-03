#!/bin/bash

repo_path=$1

apt install dos2unix -y
find $repo_path -type f \( -name "*.sh" \) -print0 | xargs -0 dos2unix
chmod -R +x $repo_path

bash $repo_path/start_services.sh $repo_path
