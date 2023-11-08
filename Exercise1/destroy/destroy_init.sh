#!/bin/bash

function remove_git {
    echo -e "\n------------- Uninstalling git\n"
    apt remove -y --purge git 
}

function remove_apache {
    echo -e "\n------------- Uninstalling apache\n"
    rm -rf /var/www/html/*
    apt remove -y --purge apache2 
}

function remove_mariadb {
    echo -e "\n------------- Uninstalling mariadb\n"
    rm -rf /var/lib/mysql
    apt remove -y --purge mariadb-* 
}

function remove_php {
    echo -e "\n------------- Uninstalling php\n"
    apt remove -y --purge php libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl 
}

function destroy_init_stage {
    if dpkg -l "git" > /dev/null 2>&1; then 
        remove_git
    else
        echo "Git is already uninstalled"
    fi

    if dpkg -l "apache2" > /dev/null 2>&1; then 
        remove_apache
    else
        echo "Apache is already uninstalled"
    fi

    if dpkg -l "mariadb*" > /dev/null 2>&1; then 
        remove_mariadb
    else
        echo "MariaDB is already uninstalled"
    fi

    if dpkg -l "php" "libapache2-mod-php" "php-mysql" "php-mbstring" "php-zip" "php-gd" "php-json" "php-curl" > /dev/null 2>&1; then
        remove_php
    else
        echo "php is already uninstalled"
    fi
}

destroy_init_stage
