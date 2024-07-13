FROM php:8.3.0-apache

ARG static_repo_files_path="./app-config"
ARG MARIADB_PASSWORD
ARG DB_HOST

WORKDIR "/home"

COPY "${static_repo_files_path}/." "/var/www/html"

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

RUN sed -i 's/"localhost"/"'${DB_HOST}'"/g' /var/www/html/config.php && \
    sed -i 's/""/"'${MARIADB_PASSWORD}'"/g' /var/www/html/config.php && \
    cat /var/www/html/config.php

RUN <<REALEND
cat << EOF > "/etc/apache2/mods-enabled/dir.conf"
<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
EOF
REALEND
