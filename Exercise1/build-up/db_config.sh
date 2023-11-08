#!/bin/bash

password="codepass"

function config_db {
    mysql -e "
    CREATE DATABASE IF NOT EXISTS devopstravel;
    CREATE USER IF NOT EXISTS 'codeuser'@'localhost' IDENTIFIED BY '${password}';
    GRANT ALL PRIVILEGES ON *.* TO 'codeuser'@'localhost';
    FLUSH PRIVILEGES;"
}

function replace_passwords {
    sed -i 's/$password/"codepass"/g' /var/www/html/config.php
}

function import_sql_script {
    devopstravel_sql="./bootcamp-devops-2023/app-295devops-travel/database/devopstravel.sql"
    mysql < $devopstravel_sql
}

config_db

replace_passwords

import_sql_script

systemctl reload apache2
