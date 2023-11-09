#!/bin/bash

password="codepass"

function provision_db {
    echo -e "\nProvisioning Database .....\n"
    mysql -e "
    CREATE DATABASE IF NOT EXISTS devopstravel;
    CREATE USER IF NOT EXISTS 'codeuser'@'localhost' IDENTIFIED BY '${password}';
    GRANT ALL PRIVILEGES ON *.* TO 'codeuser'@'localhost';
    FLUSH PRIVILEGES;
    
    SHOW DATABASES;"
}

function replace_passwords {
    echo -e "\nReplacing Database password .....\n"
    sed -i 's/""/"codepass"/g' /var/www/html/config.php

    cat /var/www/html/config.php
}

function import_sql_script {
    echo -e "\nImporting Database script .....\n"

    devopstravel_sql="./bootcamp-devops-2023/app-295devops-travel/database/devopstravel.sql"
    mysql < $devopstravel_sql
    
    mysql -e "
    USE devopstravel;
    SHOW TABLES;
    "

    systemctl reload apache2
}
