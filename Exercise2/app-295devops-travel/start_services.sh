#!/bin/bash

repo_path="/opt/vagrant/app-295devops-travel"

if [[ $(whoami) == "root" ]];
then
    cd $repo_path
    docker compose up -d --build --force-recreate
else
    echo "Root user is needed for execution ....."
fi
