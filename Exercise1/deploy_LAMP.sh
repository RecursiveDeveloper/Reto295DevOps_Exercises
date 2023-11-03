#!/bin/bash

if [[ $(whoami) == "root" ]]; 
then
    echo -e "\nSTAGE 1: [Init]\n"
    ./init.sh

    echo -e "\nSTAGE 2: [Build]\n"
    ./build.sh
else
    echo "Root user is needed for execution ....."
fi
