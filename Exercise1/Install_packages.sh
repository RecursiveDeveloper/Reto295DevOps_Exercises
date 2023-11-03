function install_git {
    sudo apt update -y
    sudo apt install git -y
}

function install_apache {
    sudo apt update -y
    sudo apt install apache2 -y
    sudo ufw allow in "Apache"
    sudo ufw status
}

function install_mysql {
    sudo apt update -y
    sudo apt install mysql-server -y
}

function install_php {
    sudo apt install php libapache2-mod-php php-mysql -y
    php -v
}

function check_packages {
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
        echo "php is already installed"
    fi
}

check_packages
