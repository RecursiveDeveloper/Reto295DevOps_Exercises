#!/bin/bash

if [[ $(whoami) == "root" ]];
then
    docker compose down --rmi all \
        --volumes \
        --remove-orphans
else
    echo "Root user is needed for execution ....."
fi
