#!/bin/bash

function install_git {
    echo -e "\n------------- Installing git\n"
    apt install git -y
    echo -e "\n$(git --version)\n"
}

function install_apache {
    echo -e "\n------------- Installing apache\n"
    apt install apache2 -y
    ufw allow in "Apache"
    ufw status
    systemctl start apache2 
    systemctl enable apache2 
    systemctl status apache2 
    echo -e "\n$(curl -f -I http://localhost:80)\n"
}

function install_mariadb {
    echo -e "\n------------- Installing mariadb\n"
    apt install mariadb-server -y
    systemctl start mariadb.service
    systemctl enable mariadb
    systemctl status mariadb
    echo -e "\n$(systemctl status mariadb)\n"
}

function install_php {
    echo -e "\n------------- Installing php\n"
    apt install php libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl -y
    echo -e "\n$(php -v)\n"
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

    dpkg -s "mariadb-server" &> /dev/null
    if [[ $? == 1 ]]; then
        install_mariadb
    else
        echo "MariaDB is already installed"
    fi

    dpkg -s "php" "libapache2-mod-php" "php-mysql" &> /dev/null
    if [[ $? == 1 ]]; then
        install_php
    else
        echo "Php is already installed"
    fi
}

check_packages
