CREATE DATABASE IF NOT EXISTS devopstravel;
CREATE USER IF NOT EXISTS 'codeuser'@'localhost' IDENTIFIED BY 'codepass';
GRANT ALL PRIVILEGES ON *.* TO 'codeuser'@'localhost';
FLUSH PRIVILEGES;
SHOW DATABASES;