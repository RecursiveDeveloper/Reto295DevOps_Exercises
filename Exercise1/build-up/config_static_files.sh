#!/bin/bash

apache_path="/var/www/html"

function check_repo {
    local repo_name="bootcamp-devops-2023"
    local repo_url="https://github.com/roxsross/bootcamp-devops-2023.git"
    local branch="clase2-linux-bash"

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

function copy_php_files {
    cp -Rf app-295devops-travel/* $apache_path
}

check_repo

copy_php_files
