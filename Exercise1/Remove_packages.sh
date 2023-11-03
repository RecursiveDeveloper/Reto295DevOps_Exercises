function remove_git {
    sudo apt remove git -y
    sudo apt purge git -y
}

function remove_apache {
    sudo apt remove apache2 -y
    sudo apt purge apache2 -y
}

function remove_mysql {
    sudo apt remove mysql-server -y
    sudo apt purge mysql-server -y
}

function remove_php {
    sudo apt remove php libapache2-mod-php php-mysql -y
    sudo apt purge php libapache2-mod-php php-mysql -y
}

function check_packages {
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

check_packages
