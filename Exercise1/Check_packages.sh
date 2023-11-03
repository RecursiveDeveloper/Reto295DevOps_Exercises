function check_packages {
    dpkg -s "git" &> /dev/null
    if [[ $? == 1 ]]; then
        sudo apt update -y
        sudo apt install git -y
    else
        echo "Git is already installed"
    fi

    dpkg -s "apache2" &> /dev/null
    if [[ $? == 1 ]]; then
        sudo apt update -y
        sudo apt install apache2 -y
        sudo ufw allow in "Apache"
        sudo ufw status
    else
        echo "Apache is already installed"
    fi

    dpkg -s "mysql-server" &> /dev/null
    if [[ $? == 1 ]]; then
        sudo apt update -y
        sudo apt install mysql-server -y
    else
        echo "MySQL is already installed"
    fi

    dpkg -s "php" "libapache2-mod-php" "php-mysql" &> /dev/null
    if [[ $? == 1 ]]; then
        sudo apt install php libapache2-mod-php php-mysql -y
        php -v
    else
        echo "php is already installed"
    fi
}

check_packages