#!/bin/bash

if [[ $(whoami) == "root" ]]; 
then
    if [[ $1 -eq 1 ]]; then
        echo -e "\nSTAGE 1: [Init]\n"
        ./build-up/install_resources.sh
    fi

    if [[ $2 -eq 1 ]]; then
        echo -e "\nSTAGE 2: [Build]\n"
        ./build-up/config_static_files.sh

        . ./build-up/config_database.sh; import_sql_script
        . ./build-up/config_database.sh; replace_passwords
    fi

    if [[ $3 -eq 1 ]]; then
        echo -e "\nSTAGE 3: [Deploy]\n"
        ###Coming soon ...
    fi
else
    echo "Root user is needed for execution ....."
fi
