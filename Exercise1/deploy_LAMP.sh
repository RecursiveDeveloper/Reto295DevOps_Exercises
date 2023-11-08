#!/bin/bash

if [[ $(whoami) == "root" ]]; 
then
    echo -e "\nSTAGE 1: [Init]\n"
    ./build-up/init.sh

    echo -e "\nSTAGE 2: [Build]\n"
    ./build-up/build.sh

    echo -e "\nSTAGE 3: [Deploy]\n"
    ./build-up/db_config.sh
else
    echo "Root user is needed for execution ....."
fi
