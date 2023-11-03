#!/bin/bash

function remove_git {
    echo -e "\n------------- Uninstalling git\n"
    apt remove git -y
    apt purge git -y
}

function remove_apache {
    echo -e "\n------------- Uninstalling apache\n"
    apt remove apache2 -y
    apt purge apache2 -y
}

function remove_mysql {
    echo -e "\n------------- Uninstalling mysql\n"
    apt remove mysql-server -y
    apt purge mysql-server -y
}

function remove_php {
    echo -e "\n------------- Uninstalling php\n"
    apt remove php libapache2-mod-php php-mysql -y
    apt purge php libapache2-mod-php php-mysql -y
}

function destroy_init_stage {
    dpkg -s "git" &> /dev/null
    if [[ $? == 0 ]]; then
        remove_git
    else
        echo "Git is already uninstalled"
    fi

    dpkg -s "apache2" &> /dev/null
    if [[ $? == 0 ]]; then
        remove_apache
    else
        echo "Apache is already uninstalled"
    fi

    dpkg -s "mysql-server" &> /dev/null
    if [[ $? == 0 ]]; then
        remove_mysql
    else
        echo "MySQL is already uninstalled"
    fi

    dpkg -s "php" "libapache2-mod-php" "php-mysql" &> /dev/null
    if [[ $? == 0 ]]; then
        remove_php
    else
        echo "php is already uninstalled"
    fi
}

function destroy_build_stage { 
    repo_name="bootcamp-devops-2023"

    find $repo_name &> /dev/null
    if [[ $? == 0 ]]; then
        rm -rf $repo_name
    fi
}

if [[ $(whoami) == "root" ]]; 
then
    echo -e "\nSTAGE 1: [Init]\n"
    destroy_init_stage

    echo -e "\nSTAGE 2: [Build]\n"
    destroy_build_stage
else
    echo "Root user is needed for execution ....."
fi
