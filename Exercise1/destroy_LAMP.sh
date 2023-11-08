#!/bin/bash

if [[ $(whoami) == "root" ]]; 
then
    echo -e "\nSTAGE 1: [Init]\n"
    ./destroy/destroy_init.sh

    echo -e "\nSTAGE 2: [Build]\n"
    ./destroy/destroy_build.sh
else
    echo "Root user is needed for execution ....."
fi
