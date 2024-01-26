#!/bin/bash

clone_path=$1
repo_name=$2
repo_url=$3
branch=$4
owner="vagrant"

if [[ $(whoami) == "root" ]];
then
    cd $clone_path
    find $repo_name &> /dev/null
    if [[ $? == 1 ]]; then
        git clone $repo_url
        chown -R $owner:$owner $repo_name/
    fi

    find $repo_name &> /dev/null
    if [[ $? == 0 ]]; then
        cd $repo_name
        git checkout $branch
        git pull origin $branch
    fi
    cd $clone_path
    docker compose up -d --build --force-recreate
else
    echo "Root user is needed for execution ....."
fi
