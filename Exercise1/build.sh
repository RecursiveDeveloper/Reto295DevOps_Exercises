#!/bin/bash

function check_repo {
    repo_name="bootcamp-devops-2023"
    repo_url="https://github.com/roxsross/bootcamp-devops-2023.git"
    branch="ejercicio1-automatiza"

    find $repo_name &> /dev/null
    if [[ $? == 1 ]]; then
        git clone $repo_url
    fi
    
    find $repo_name &> /dev/null
    if [[ $? == 0 ]]; then
        cd $repo_name
        git checkout $branch
        git pull origin $branch
    fi
}

check_repo
