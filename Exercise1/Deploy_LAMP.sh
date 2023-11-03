#!/bin/bash


if [[ $(whoami) == "root" ]]; 
then     
    ./Check_packages.sh
else 
    echo "Root user is needed for execution ....."
fi
