#!/bin/bash

repo_name="bootcamp-devops-2023"
repo_url="https://github.com/roxsross/bootcamp-devops-2023.git"
branch="ejercicio2-dockeriza"

if [[ $(whoami) == "root" ]];
then
    find $repo_name &> /dev/null
    if [[ $? == 1 ]]; then
        git clone $repo_url
    fi

    find $repo_name &> /dev/null
    if [[ $? == 0 ]]; then
        cd "$repo_name"
        git checkout $branch
        git pull origin $branch
        cd "295words-docker/api/"
    fi

    docker compose up -d --build --force-recreate
else
    echo "Root user is needed for execution ....."
fi
