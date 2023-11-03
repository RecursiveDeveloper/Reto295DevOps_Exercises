#!/bin/bash

function install_git {
    echo -e "\n------------- Installing git\n"
    apt install git -y
}

function install_apache {
    echo -e "\n------------- Installing apache\n"
    apt install apache2 -y
    ufw allow in "Apache"
    ufw status
}

function install_mysql {
    echo -e "\n------------- Installing mysql\n"
    apt install mysql-server -y
}

function install_php {
    echo -e "\n------------- Installing php\n"
    apt install php libapache2-mod-php php-mysql -y
    php -v
}

function check_packages {
    apt update -y

    dpkg -s "git" &> /dev/null
    if [[ $? == 1 ]]; then
        install_git
    else
        echo "Git is already installed"
    fi

    dpkg -s "apache2" &> /dev/null
    if [[ $? == 1 ]]; then
        install_apache
    else
        echo "Apache is already installed"
    fi

    dpkg -s "mysql-server" &> /dev/null
    if [[ $? == 1 ]]; then
        install_mysql
    else
        echo "MySQL is already installed"
    fi

    dpkg -s "php" "libapache2-mod-php" "php-mysql" &> /dev/null
    if [[ $? == 1 ]]; then
        install_php
    else
        echo "Php is already installed"
    fi
}

check_packages
