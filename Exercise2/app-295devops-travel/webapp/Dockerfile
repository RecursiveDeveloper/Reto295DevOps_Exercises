FROM php:apache

ARG apache_path="/var/www/html"
ARG apache_config_file="/etc/apache2/mods-enabled/dir.conf"
ARG static_repo_files_path="./bootcamp-devops-2023/app-295devops-travel"

WORKDIR "/home"

COPY "${static_repo_files_path}/." "${apache_path}"

RUN chown -R "$USER":"$USER" "${apache_path}"

RUN <<EOF
    sed -i 's/""/"codepass"/g' /var/www/html/config.php
    cat /var/www/html/config.php
EOF

RUN <<REALEND
cat << EOF > "${apache_config_file}"
    <IfModule mod_dir.c>
        DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
    </IfModule>
EOF
REALEND
