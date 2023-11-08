#!/bin/bash

function destroy_build_stage { 
    repo_name="bootcamp-devops-2023"

    find $repo_name &> /dev/null
    if [[ $? == 0 ]]; then
        rm -rf $repo_name
    fi
}

destroy_build_stage
