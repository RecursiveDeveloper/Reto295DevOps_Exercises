#!/bin/bash

repo_path=$1

if [[ $(whoami) == "root" ]];
then
    cd $repo_path
    docker compose up -d --build --force-recreate
else
    echo "Root user is needed for execution ....."
fi
