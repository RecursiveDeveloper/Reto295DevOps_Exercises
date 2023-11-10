#!/bin/bash

if [[ $(whoami) == "root" ]]; 
then
    echo -e "\nSTAGE 1: [Init]\n"
    ./build-up/install_resources.sh

    echo -e "\nSTAGE 2: [Build]\n"
    ./build-up/config_static_files.sh

    . ./build-up/config_mariadb.sh; import_sql_script
    . ./build-up/config_mariadb.sh; replace_passwords

    echo -e "\nSTAGE 3: [Deploy]\n"
    systemctl reload apache2
    curl -I localhost

    echo -e "\nSTAGE 4: [Notify]\n"
    . ./notify/discord.sh ./../../Reto295DevOps_Exercises/    
else
    echo "Root user is needed for execution ....."
fi
